Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD9E5A90
	for <regressions@lists.linux.dev>; Thu, 22 Sep 2022 15:21:33 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id a20so6469331qtw.10
        for <regressions@lists.linux.dev>; Thu, 22 Sep 2022 08:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5wbLjt1ptS0e2F3zuisLshb8cZoB85PXpRGachu4Ne0=;
        b=B0N67shCLmh8S+ozh3K7g7ZwcCkrdaE+l+99/a1Con6JqUaSBK1bJbYw1ReoAHGnhF
         MG96gHiSSP+Cc3RHre7S1EUJ5L9Iw08mZ3VWPQH+sS+zdRcK3BEbcP4diYtL8FL4cxNX
         vOOXY0mxeHlDyxmWeS7ih4a4iOHVU8uEDAdwSGWtXmnHXexUyC7r60sH6S9PRiLonHwS
         QE1azKB/S6GmyF8yp3BuGrZBJ3j4DOGKlu19zdu02oeWWDL3qXK+SG54XUG78TRIeJMu
         m9mdFyySrmMY3phsAQvPzM4xOgv9vhxL2Cg5Q7pHTO4Hh7wJYjSpvbVfkZCDMYeMAvDz
         ZjiQ==
X-Gm-Message-State: ACrzQf1v7tgIEd3fuEj9sMfq4ns3f+h6n1ZrhhiCBf0OORIyKd5sGtb2
	jxlddOj2DNjrHdpLiWADs+CfHM5O/YDp9SR6dMI=
X-Google-Smtp-Source: AMsMyM5JmyzM4Fn/yqQRqQjVZKnHwOkYTyAYwNcaYjs7UcT6AaG61yAPacMz920Hs8k7dLP3uYB83NuneFPF1cweQqI=
X-Received: by 2002:a05:622a:11c8:b0:35c:e912:a8ea with SMTP id
 n8-20020a05622a11c800b0035ce912a8eamr3273123qtk.17.1663860092476; Thu, 22 Sep
 2022 08:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220921063638.2489-1-kprateek.nayak@amd.com> <YysnE8rcZAOOj28A@hirez.programming.kicks-ass.net>
 <YytqfVUCWfv0XyZO@zn.tnic> <YywaAcTdLSuDlRfl@hirez.programming.kicks-ass.net>
In-Reply-To: <YywaAcTdLSuDlRfl@hirez.programming.kicks-ass.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 22 Sep 2022 17:21:21 +0200
Message-ID: <CAJZ5v0i9P-srVxrSPZOkXhKVCA2vEQqm5B4ZZifS=ivpwv+A-w@mail.gmail.com>
Subject: Re: [PATCH] ACPI: processor_idle: Skip dummy wait for processors
 based on the Zen microarchitecture
To: Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, andi@lisas.de, Pu Wen <puwen@hygon.cn>, 
	Mario Limonciello <mario.limonciello@amd.com>, "Zhang, Rui" <rui.zhang@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, ananth.narayan@amd.com, 
	gautham.shenoy@amd.com, Calvin Ong <calvin.ong@amd.com>, 
	Stable <stable@vger.kernel.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 22, 2022 at 10:17 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Sep 21, 2022 at 09:48:13PM +0200, Borislav Petkov wrote:
> > On Wed, Sep 21, 2022 at 05:00:35PM +0200, Peter Zijlstra wrote:
> > > On Wed, Sep 21, 2022 at 12:06:38PM +0530, K Prateek Nayak wrote:
> > > > Processors based on the Zen microarchitecture support IOPORT based deeper
> > > > C-states.
> > >
> > > I've just gotta ask; why the heck are you using IO port based idle
> > > states in 2022 ?!?! You have have MWAIT, right?
> >
> > They have both. And both is Intel technology. And as I'm sure you
> > know AMD can't do their own thing - they kinda have to follow Intel.
> > Unfortunately.
> >
> > Are you saying modern Intel chipsets don't do IO-based C-states anymore?
>
> I've no idea what they do, but Linux exclusively uses MWAIT on Intel as
> per intel_idle.c.

Well, it can be forced to use ACPI idle instead.

> MWAIT also cuts down on IPIs because it wakes from the TIF write.

Right.
