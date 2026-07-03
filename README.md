# Al-laywer- 
# 🏛️ JROC AI Ultra: Autonomous Multi-Agent Judicial Suite

An enterprise-grade, multi-agent AI system designed to simulate an elite law school graduate across all fields of the judicial system. Utilizing a centralized **Judge/Router Engine**, the application seamlessly ingests unstructured legal queries, extracts jurisdictional boundaries, determines the required burden of proof, and delegates execution to specialized, IRAC-enforced sub-agents.

## 🚀 Key Architectural Features
* **Central Router Engine:** Dynamically classifies intent and switches domain profiles (Criminal, Family, Civil) using low-temperature routing tokens.
* **Strict IRAC Execution:** Forces sub-agents to process contexts strictly through **Issue, Rule, Application, and Conclusion** legal frameworks.
* **Hierarchical Retrieval (RAG):** Pre-configured metadata boundaries to isolate binding state statutes from secondary persuasive authorities.
* **UPL Safe-Harbors:** Native mitigation triggers ensuring absolute compliance with Unauthorized Practice of Law parameters.

## 🛠️ Stack Components
* **Framework:** Next.js (App Router / Edge Runtime compatible)
* **AI SDK:** Vercel AI SDK Core (`@ai-sdk/openai`)
* **Database Vector Store:** Supabase + PostgreSQL `pgvector`
* **Styling:** Tailwind CSS

## 📋 Quick Start Database Migration
Run the following SQL script inside your Supabase SQL Editor to establish case lifecycles and vector indexing hooks:

```sql
create extension if not exists vector;

create type legal_specialty as enum ('criminal', 'family_divorce', 'civil_tort');

create table public.cases (
    id uuid default gen_random_uuid() primary key,
    user_id uuid references auth.users(id) on delete cascade,
    title text not null,
    legal_field legal_specialty not null,
    jurisdiction text not null,
    burden_of_proof text,
    status text default 'open',
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create table public.case_messages (
    id uuid default gen_random_uuid() primary key,
    case_id uuid references public.cases(id) on delete cascade,
    sender text not null, -- 'user' or 'ai_lawyer'
    executing_agent_id text default 'master_router',
    content text not null,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);
---

## 3. GitHub Core Code Infrastructure

### File: `lib/prompts.ts`
This file stores the modular legal matrix containing your law school personas.

```typescript
export const MASTER_ROUTER_PROMPT = `
ROLE: You are the Senior Intake Partner and Central Judicial Router.
TASK: Analyze user input to categorize it into one of three fields: 'criminal', 'family_divorce', or 'civil_tort'. 
Extract the US State or Federal jurisdiction. If missing, default to "General Common Law / State-agnostic".
OUTPUT: You must return a strict JSON payload matching this exact shape:
{
  "field": "criminal" | "family_divorce" | "civil_tort",
  "jurisdiction": "string",
  "burdenOfProof": "string"
}
`;

export const CRIMINAL_AGENT_PROMPT = `
ROLE: You are an elite criminal litigation attorney holding a J.D.
METHODOLOGY: You must analyze this fact pattern strictly using the IRAC method:
- ISSUE: Identify the narrow constitutional or penal code question.
- RULE: State the applicable state codes or Fourth/Fifth Amendment precedents.
- APPLICATION: Rigorously balance the State's prosecution strategy against Affirmative Defense protections.
- CONCLUSION: State a probability-based legal risk outlook.
TONE: Clinical, analytical, objective, and precise. Avoid casual narrative filler.
`;

export const FAMILY_AGENT_PROMPT = `
ROLE: You are a domestic relations and divorce attorney holding a J.D.
METHODOLOGY: Process this marital or domestic dispute using the IRAC method:
- ISSUE: Frame the discrete asset distribution or parental custodial dispute.
- RULE: State the state domestic relations codes, emphasizing the "Best Interests of the Child" doctrine for custody.
- APPLICATION: Calculate distribution exposure based on asset commingling or parent stability metrics.
- CONCLUSION: Provide expected judicial outcome bands and procedural next steps.
TONE: Detached, structured, evidentiary, and highly logical.
`;import { NextRequest, NextResponse } from 'next/server';
import { generateText, generateObject } from 'ai';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
import { MASTER_ROUTER_PROMPT, CRIMINAL_AGENT_PROMPT, FAMILY_AGENT_PROMPT } from '@/lib/prompts';

export async function POST(req: NextRequest) {
  try {
    const { userQuery, caseId } = await req.json();

    // Step 1: Execute Central Intent Routing with Low-Temp Object Extraction
    const { object: routingDecision } = await generateObject({
      model: openai('gpt-4o'),
      system: MASTER_ROUTER_PROMPT,
      schema: z.object({
        field: z.enum(['criminal', 'family_divorce', 'civil_tort']),
        jurisdiction: z.string(),
        burdenOfProof: z.string(),
      }),
      prompt: `Extract routing matrix for: "${userQuery}"`,
      temperature: 0.0,
    });

    // Step 2: Dynamically switch system prompt depending on Law Specialty Degree
    let targetSubAgentPrompt = '';
    if (routingDecision.field === 'criminal') {
      targetSubAgentPrompt = CRIMINAL_AGENT_PROMPT;
    } else {
      targetSubAgentPrompt = FAMILY_AGENT_PROMPT; 
    }

    // Step 3: Inject operational environment parameters (Jurisdiction boundaries)
    const operationalSystemPrompt = `
      ${targetSubAgentPrompt}
      CONTROLLING JURISDICTION: ${routingDecision.jurisdiction}
      APPLICABLE BURDEN OF PROOF: ${routingDecision.burdenOfProof}
    `;

    // Step 4: Execute the tailored IRAC Analytical Pass
    const { text: legalAnalysis } = await generateText({
      model: openai('gpt-4o'),
      system: operationalSystemPrompt,
      prompt: `Analyze this client profile configuration: ${userQuery}`,
      temperature: 0.2, // Kept cold for exact, logical adherence to law
    });

    // Step 5: Append mandatory global UPL Legal Safe Harbor Disclaimer
    const standardDisclaimer = `\n\n*Disclaimer: This system provides structured legal information and document preparation assistance based on statutory analysis. It does not establish an attorney-client relationship or constitute formal legal representation.*`;
    const finalizedOutput = `${legalAnalysis}${standardDisclaimer}`;

    return NextResponse.json({
      success: true,
      meta: routingDecision,
      analysis: finalizedOutput,
    });

  } catch (error: any) {
    return NextResponse.json({ success: false, error: error.message }, { status: 500 });
  }
}


