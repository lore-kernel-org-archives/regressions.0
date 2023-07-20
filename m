Received: from mailgw.gate-on.net (auth.Gate-On.Net [210.197.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC931E501
	for <regressions@lists.linux.dev>; Thu, 20 Jul 2023 23:40:07 +0000 (UTC)
Received: from vega.pgw.jp (unknown [49.135.109.134])
	by mailgw.gate-on.net (Postfix) with ESMTP id B4DD0802A3;
	Fri, 21 Jul 2023 08:39:58 +0900 (JST)
Received: from localhost (vega.pgw.jp [10.5.0.30])
	by vega.pgw.jp (Postfix) with SMTP
	id BF312A53D; Fri, 21 Jul 2023 08:39:55 +0900 (JST)
From: <kkabe@vega.pgw.jp>
Content-Type: text/plain; charset=ISO-2022-JP
To: rostedt@goodmis.org
Cc: regressions@lists.linux.dev, bagasdotme@gmail.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	Xinhui.Pan@amd.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	kkabe@vega.pgw.jp
Subject: Re: radeon.ko/i586: BUG: kernel NULL pointer dereference,address:00000004
In-Reply-To: Your message of "Mon, 17 Jul 2023 11:36:23 -0400".
	<20230717113623.41878887@gandalf.local.home>
X-Mailer: mnews [version 1.22PL5] 2002-11-27(Wed)
Date: Fri, 21 Jul 2023 08:39:55 +0900
Message-ID: <230721083955.M0102626@vega.pgw.jp>
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

Unfortunately this patch didn't fix freedesktop.org 5.18.0-rc2 tree.
(vblank->worker == NULL check fires otherwise a panic)

Applying this to kernel.org 6.4.3 results in totally different error as in 
https://bugzilla.kernel.org/show_bug.cgi?id=217669#c0
so there may be multiple regressions I'm chasing.

-- 
kabe

