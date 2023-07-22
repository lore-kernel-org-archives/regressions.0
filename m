Received: from mailgw.gate-on.net (auth.Gate-On.Net [210.197.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF9EADC
	for <regressions@lists.linux.dev>; Sat, 22 Jul 2023 02:30:20 +0000 (UTC)
Received: from vega.pgw.jp (unknown [49.135.109.134])
	by mailgw.gate-on.net (Postfix) with ESMTP id 96BCC802A7;
	Sat, 22 Jul 2023 11:30:18 +0900 (JST)
Received: from localhost (vega.pgw.jp [10.5.0.30])
	by vega.pgw.jp (Postfix) with SMTP
	id 265E2A53D; Sat, 22 Jul 2023 11:30:14 +0900 (JST)
From: <kabe@vega.pgw.jp>
To: rostedt@goodmis.org
Cc: regressions@lists.linux.dev, bagasdotme@gmail.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	Xinhui.Pan@amd.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	kkabe@vega.pgw.jp
Subject: Re: radeon.ko/i586: BUG: kernel NULL pointer dereference,address:00000004
In-Reply-To: Your message of "Fri, 21 Jul 2023 08:39:55 +0900".
	<230721083955.M0102626@vega.pgw.jp>
X-Mailer: mnews [version 1.22PL5] 2002-11-27(Wed)
Date: Sat, 22 Jul 2023 11:30:14 +0900
Message-ID: <230722113014.M0204460@vega.pgw.jp>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>

rostedt@goodmis.org sed in <20230717113623.41878887@gandalf.local.home>

>> On Fri, 14 Jul 2023 14:34:04 +0900
>> <kkabe@vega.pgw.jp> wrote:
>> 
>> > Patch in
>> > https://bugzilla.kernel.org/show_bug.cgi?id=217669#c4
>> > fixed the problem in freedesktop.org kernel 5.18.0-rc2 .
>> > This may explain that in kernel.org tree, the said commit is in kernel-5.19.
>> 
>> You mean the patch that adds:
>> 
>> 	#if defined(FTRACE_MCOUNT_MAX_OFFSET) && (FTRACE_MCOUNT_MAX_OFFSET)
>> 
>> ?
>> 
>> Nothing should be setting FTRACE_MCOUNT_MAX_OFFSET to anything but non
>> zero. But doing a grep, I now see:
>> 
>> # define FTRACE_MCOUNT_MAX_OFFSET ENDBR_INSN_SIZE
>> 
>> Where it breaks that assumption if ENDBR_INSN_SIZE == 0 :-p
>>  (and that's my code!)
>> 
>> OK, does this fix it? (I haven't tested nor compiled this)
>> 
>> -- Steve
>> 
>> diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
>> index 897cf02c20b1..801f4414da3e 100644
>> --- a/arch/x86/include/asm/ftrace.h
>> +++ b/arch/x86/include/asm/ftrace.h
>> @@ -13,7 +13,7 @@
>>  #ifdef CONFIG_HAVE_FENTRY
>>  # include <asm/ibt.h>
>>  /* Add offset for endbr64 if IBT enabled */
>> -# define FTRACE_MCOUNT_MAX_OFFSET	ENDBR_INSN_SIZE
>> +# define FTRACE_MCOUNT_MAX_OFFSET	(ENDBR_INSN_SIZE + MCOUNT_INSN_SIZE)
>>  #endif
>>  
>>  #ifdef CONFIG_DYNAMIC_FTRACE
>> 

Above patch didn't work, but
Does it matter that I am compiling with "gcc -fcf-protection=none"
to not emit endbr32 instructions for i586?

-- 
kabe
