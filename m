Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF29166E8
	for <regressions@lists.linux.dev>; Thu, 22 Sep 2022 15:53:29 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id c6so7093747qvn.6
        for <regressions@lists.linux.dev>; Thu, 22 Sep 2022 08:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vD0+VxiAGurIOKv6AW3dsyvyb0Nd5x0MkeebHLF5GZY=;
        b=nGeclGlyN9ht+EEwuEIx61J5tR2SANAkRmfjnwHbXWS35fWgcD6LcDFcpcW9j81jGv
         qCivRk/TyaRes367Q/inqYqvtMZI/aETkJsp0Q/tfIKA28BdmJxAtLEILjw+AZJiM76+
         STippFYLwxdtDzk9rGCtGsnn8FQoHdI318yx3bIjntyS1opzEHirR0zi1kdrKzc2GIZT
         yG1gBcZ0/g/DJq2ve+qwoSpAJp2wwd7ffv+QFUbOPAhLVCpnOVE2yipt8SYUWLVlfgoV
         YvOqyvnwewhWX2JjHiY2bOFafETOx5oS9ZBJD1TMpRi5ob//VzjivgTXuBfKZiYuJCBf
         qfTQ==
X-Gm-Message-State: ACrzQf3VWqDQCh//5bAoWxM2GSE5Kz1asikq4V1jORU/BHBgBrK9T5AA
	Bf8DLQZd/9mA9yPBBoZ3Ci+0MZNbw8JY9SQY1jo=
X-Google-Smtp-Source: AMsMyM7uV5oXIb+tahsXXoQim6m4K48OLfD7owDsxQLXf2RDEqng6L3d0fltb2aUF4yFYR35Ezp55+QqlvRaTemITlA=
X-Received: by 2002:a05:6214:1cc9:b0:496:aa2c:c927 with SMTP id
 g9-20020a0562141cc900b00496aa2cc927mr3110108qvd.15.1663862008742; Thu, 22 Sep
 2022 08:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220921063638.2489-1-kprateek.nayak@amd.com> <YysnE8rcZAOOj28A@hirez.programming.kicks-ass.net>
 <YytqfVUCWfv0XyZO@zn.tnic> <YywaAcTdLSuDlRfl@hirez.programming.kicks-ass.net>
 <CAJZ5v0i9P-srVxrSPZOkXhKVCA2vEQqm5B4ZZifS=ivpwv+A-w@mail.gmail.com> <YyyA9AV9qiPxmmpb@zn.tnic>
In-Reply-To: <YyyA9AV9qiPxmmpb@zn.tnic>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 22 Sep 2022 17:53:17 +0200
Message-ID: <CAJZ5v0i0NzJfRuqcuJQC3J5moaEikoRusquCybAz0T8dMy8gCw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: processor_idle: Skip dummy wait for processors
 based on the Zen microarchitecture
To: Borislav Petkov <bp@alien8.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, andi@lisas.de, 
	Pu Wen <puwen@hygon.cn>, Mario Limonciello <mario.limonciello@amd.com>, 
	"Zhang, Rui" <rui.zhang@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, ananth.narayan@amd.com, gautham.shenoy@amd.com, 
	Calvin Ong <calvin.ong@amd.com>, Stable <stable@vger.kernel.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 22, 2022 at 5:36 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Thu, Sep 22, 2022 at 05:21:21PM +0200, Rafael J. Wysocki wrote:
> > Well, it can be forced to use ACPI idle instead.
>
> Yeah, I did that earlier. The dummy IO read in question costs ~3K on
> average on my Coffeelake box here.

Well, that's the cost of forcing something non-default.
