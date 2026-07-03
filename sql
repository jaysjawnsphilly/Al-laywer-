import React from 'react';

export default function AgentBuilderDashboard() {
  return (
    <div className="flex h-screen bg-slate-900 text-slate-100 font-sans selection:bg-indigo-500/30">
      
      {/* 1. SIDEBAR NAVIGATION */}
      <aside className="w-64 bg-slate-950 border-r border-slate-800 flex flex-col justify-between">
        <div>
          {/* Logo / Header */}
          <div className="p-6 border-b border-slate-800 flex items-center gap-3">
            <div className="h-8 w-8 rounded-lg bg-gradient-to-tr from-indigo-500 to-violet-500 flex items-center justify-center font-bold text-white shadow-lg shadow-indigo-500/20">
              J
            </div>
            <div>
              <h1 className="font-bold tracking-tight text-sm text-white">JROC AI Ultra</h1>
              <span className="text-xs text-slate-500 font-medium">Judicial Suite v2.0</span>
            </div>
          </div>

          {/* Navigation Links */}
          <nav className="p-4 space-y-1">
            <a href="#" className="flex items-center gap-3 px-3 py-2.5 rounded-lg bg-indigo-600 text-white font-medium text-sm transition-all shadow-md shadow-indigo-600/10">
              <span className="text-lg">⚙️</span> Orchestrator
            </a>
            <a href="#" className="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-400 hover:bg-slate-900 hover:text-slate-200 font-medium text-sm transition-all">
              <span className="text-lg">⚖️</span> Legal Modules
            </a>
            <a href="#" className="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-400 hover:bg-slate-900 hover:text-slate-200 font-medium text-sm transition-all">
              <span className="text-lg">🗄️</span> Supabase Vectors
            </a>
            <a href="#" className="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-400 hover:bg-slate-900 hover:text-slate-200 font-medium text-sm transition-all">
              <span className="text-lg">📜</span> Case Logs
            </a>
          </nav>
        </div>

        {/* System Status Footer */}
        <div className="p-4 border-t border-slate-800 bg-slate-950/50">
          <div className="flex items-center justify-between text-xs text-slate-400 mb-2">
            <span>Router Engine</span>
            <span className="flex items-center gap-1.5 text-emerald-400 font-medium">
              <span className="h-1.5 w-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
              Operational
            </span>
          </div>
          <div className="w-full bg-slate-800 h-1.5 rounded-full overflow-hidden">
            <div className="bg-gradient-to-r from-indigo-500 to-violet-500 h-full w-[88%]"></div>
          </div>
        </div>
      </aside>

      {/* 2. MAIN WORKSPACE CONTENT */}
      <main className="flex-1 flex flex-col min-w-0 overflow-y-auto">
        
        {/* Top Operational Ribbon */}
        <header className="h-16 border-b border-slate-800 bg-slate-900/50 backdrop-blur-md px-8 flex items-center justify-between sticky top-0 z-10">
          <div className="flex items-center gap-4">
            <span className="text-xs font-semibold uppercase tracking-wider text-indigo-400 px-2 py-1 rounded bg-indigo-500/10 border border-indigo-500/20">
              Active Project
            </span>
            <h2 className="text-sm font-semibold text-slate-200">Central Judicial Router Chain</h2>
          </div>
          <div className="flex items-center gap-3">
            <button className="px-3 py-1.5 rounded-lg border border-slate-700 hover:border-slate-600 text-xs font-medium transition-all bg-slate-800">
              Test Pipeline
            </button>
            <button className="px-3 py-1.5 rounded-lg bg-gradient-to-r from-indigo-500 to-violet-500 hover:from-indigo-600 hover:to-violet-600 text-xs font-medium text-white shadow-md shadow-indigo-500/10 transition-all">
              Deploy Changes
            </button>
          </div>
        </header>

        {/* Body Section */}
        <div className="p-8 max-w-7xl w-full mx-auto space-y-8">
          
          {/* Header Description */}
          <div>
            <h3 className="text-2xl font-bold tracking-tight text-white">Multi-Agent Infrastructure</h3>
            <p className="text-slate-400 text-sm mt-1">Configure systemic cognitive models, prompt parameters, and conditional runtime switches.</p>
          </div>

          {/* ACTIVE SUB-AGENTS LISTING */}
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
            
            {/* Agent Card: Criminal Specialty */}
            <div className="bg-slate-950 border border-slate-800 rounded-xl p-6 hover:border-slate-700/80 transition-all flex flex-col justify-between group">
              <div>
                <div className="flex items-start justify-between mb-4">
                  <div className="p-3 rounded-lg bg-rose-500/10 border border-rose-500/20 text-rose-400 text-xl">
                    ⛓️
                  </div>
                  <span className="text-xs font-mono px-2 py-0.5 rounded bg-slate-900 border border-slate-800 text-slate-400">
                    Temp: 0.2
                  </span>
                </div>
                <h4 className="text-base font-semibold text-slate-100 group-hover:text-indigo-400 transition-colors">Criminal Law Specialist</h4>
                <p className="text-xs text-slate-400 mt-1 line-clamp-2">Enforces procedural integrity, Fourth Amendment evaluation, and statutory penal code parsing.</p>
                
                {/* Embedded Framework Tags */}
                <div className="mt-4 flex flex-wrap gap-1.5">
                  <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-slate-900 border border-slate-800 text-slate-400">IRAC Formatted</span>
                  <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-slate-900 border border-slate-800 text-slate-400">Constitutional Guardrails</span>
                </div>
              </div>
              <div className="mt-6 pt-4 border-t border-slate-900 flex justify-end gap-2">
                <button className="px-2.5 py-1.5 rounded-md hover:bg-slate-900 text-slate-400 hover:text-slate-200 text-xs font-medium transition-all">Configure</button>
                <button className="px-2.5 py-1.5 rounded-md text-indigo-400 hover:text-indigo-300 hover:bg-indigo-500/5 text-xs font-medium transition-all">View System Prompt</button>
              </div>
            </div>

            {/* Agent Card: Family Specialty */}
            <div className="bg-slate-950 border border-slate-800 rounded-xl p-6 hover:border-slate-700/80 transition-all flex flex-col justify-between group">
              <div>
                <div className="flex items-start justify-between mb-4">
                  <div className="p-3 rounded-lg bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 text-xl">
                    💔
                  </div>
                  <span className="text-xs font-mono px-2 py-0.5 rounded bg-slate-900 border border-slate-800 text-slate-400">
                    Temp: 0.1
                  </span>
                </div>
                <h4 className="text-base font-semibold text-slate-100 group-hover:text-indigo-400 transition-colors">Domestic Relations Specialist</h4>
                <p className="text-xs text-slate-400 mt-1 line-clamp-2">Calculates asset dissolution equity fractions, child support formulas, and custody welfare vectors.</p>
                
                {/* Embedded Framework Tags */}
                <div className="mt-4 flex flex-wrap gap-1.5">
                  <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-slate-900 border border-slate-800 text-slate-400">IRAC Formatted</span>
                  <span className="text-[10px] font-mono px-2 py-0.5 rounded bg-slate-900 border border-slate-800 text-slate-400">Best Interests Doctrine</span>
                </div>
              </div>
              <div className="mt-6 pt-4 border-t border-slate-900 flex justify-end gap-2">
                <button className="px-2.5 py-1.5 rounded-md hover:bg-slate-900 text-slate-400 hover:text-slate-200 text-xs font-medium transition-all">Configure</button>
                <button className="px-2.5 py-1.5 rounded-md text-indigo-400 hover:text-indigo-300 hover:bg-indigo-500/5 text-xs font-medium transition-all">View System Prompt</button>
              </div>
            </div>

          </div>

          {/* RUNTIME SYSTEM CONFIGURATION BAR */}
          <div className="bg-slate-950 border border-slate-800 rounded-xl p-6">
            <h4 className="text-sm font-semibold text-slate-200 mb-4 flex items-center gap-2">
              <span className="text-indigo-400">👁️‍🗨️</span> Global Router Logic Guardrails
            </h4>
            <div className="space-y-4">
              <div className="flex items-center justify-between p-3 rounded-lg bg-slate-900/50 border border-slate-800">
                <div>
                  <span className="text-xs font-medium block text-slate-200">Enforce Strict Legal Disclaimers (Anti-UPL)</span>
                  <span className="text-[11px] text-slate-500">Automatically appends safe-harbor structural text to message frames.</span>
                </div>
                <div className="h-5 w-9 bg-indigo-600 rounded-full p-0.5 cursor-pointer flex justify-end transition-all">
                  <div className="h-4 w-4 bg-white rounded-full shadow-sm"></div>
                </div>
              </div>
              <div className="flex items-center justify-between p-3 rounded-lg bg-slate-900/50 border border-slate-800">
                <div>
                  <span className="text-xs font-medium block text-slate-200">Mandatory Geographic Discovery Verification</span>
                  <span className="text-[11px] text-slate-500">Halts execution pipeline if the state or municipal venue is not declared.</span>
                </div>
                <div className="h-5 w-9 bg-indigo-600 rounded-full p-0.5 cursor-pointer flex justify-end transition-all">
                  <div className="h-4 w-4 bg-white rounded-full shadow-sm"></div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </main>

    </div>
  );
}
