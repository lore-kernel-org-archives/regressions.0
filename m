Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70DB17F8
	for <regressions@lists.linux.dev>; Sun, 23 Jul 2023 14:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283B8C433C8;
	Sun, 23 Jul 2023 14:27:44 +0000 (UTC)
Date: Sun, 23 Jul 2023 10:27:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: <kabe@vega.pgw.jp>
Cc: regressions@lists.linux.dev, bagasdotme@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kkabe@vega.pgw.jp
Subject: Re: radeon.ko/i586: BUG: kernel NULL pointer
 dereference,address:00000004
Message-ID: <20230723102733.70baeb1a@rorschach.local.home>
In-Reply-To: <230722113014.M0204460@vega.pgw.jp>
References: <230721083955.M0102626@vega.pgw.jp>
	<230722113014.M0204460@vega.pgw.jp>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Jul 2023 11:30:14 +0900
<kabe@vega.pgw.jp> wrote:

> >> diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
> >> index 897cf02c20b1..801f4414da3e 100644
> >> --- a/arch/x86/include/asm/ftrace.h
> >> +++ b/arch/x86/include/asm/ftrace.h
> >> @@ -13,7 +13,7 @@
> >>  #ifdef CONFIG_HAVE_FENTRY
> >>  # include <asm/ibt.h>
> >>  /* Add offset for endbr64 if IBT enabled */
> >> -# define FTRACE_MCOUNT_MAX_OFFSET	ENDBR_INSN_SIZE
> >> +# define FTRACE_MCOUNT_MAX_OFFSET	(ENDBR_INSN_SIZE + MCOUNT_INSN_SIZE)
> >>  #endif
> >>  
> >>  #ifdef CONFIG_DYNAMIC_FTRACE
> >>   
> 
> Above patch didn't work, but
> Does it matter that I am compiling with "gcc -fcf-protection=none"
> to not emit endbr32 instructions for i586?

This patch is supposed to address the case when ENDBR_INSN_SIZE is
zero. So I would think that that wouldn't matter.

-- Steve
