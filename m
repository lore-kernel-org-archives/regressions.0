Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2181ADF62
	for <regressions@lists.linux.dev>; Wed,  3 May 2023 19:00:41 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ab267e3528so5369455ad.0
        for <regressions@lists.linux.dev>; Wed, 03 May 2023 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683140440; x=1685732440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TixecA9/pAM4HarsIzbsqo9aEePqi7NlMoMwpBqZ4sg=;
        b=nj0vJNwdVVt0leIQqG7LNcDsn0HBv/2LB5bpwahmUCsC/miRMRioHYtWRmIyKRa4q7
         /LerloBVswHzbFX9CCyUDnpxP/IQ/6PnLLqQpfWnc1NbH+CLoy/qomCuLXbQ/hm7GXbY
         9K1llkLMVIzXH+9erLCPKYeKOCMjPHTi+/CtZTNMV7mXRuC6JsIf5ggN/rnrAz1NhNXa
         eh05/yDdnx52+JINCk6ZeL/o57hnKkS0hVq+XSd3MGLHBk2Mi4AWCPwwxseywCc+V8EF
         Yaorgf1eIpLSqB3Zpcj6GvY7Tq1yLUSj/1p4qXhmSy1aAY4pRffG6YTjpr/A2bnDbK8l
         sQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683140440; x=1685732440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TixecA9/pAM4HarsIzbsqo9aEePqi7NlMoMwpBqZ4sg=;
        b=YNr4PpYnLYuzR2qAfByUs9+D0KKCjQJlcXUL5kWSurHXuwQrz1woTd8o+kvvoEyec9
         xwKBy4+7Eysbc5HmcDtQzdVF66Fcf0k/wjPtPJ0VGsYy4dibOUEoIFAuGiORCZ16NFDW
         JCP7QzyU8p5ydqi7HSMv8bHmcnbuz0qBu9tGRhXyU4b1GxV4JpCyDWgSw93ugt8IZ94d
         dukTtmlwDYzAQaKsEuNr0WNAmwFomXCLJETF821XVgcIVXtyVtgymMsggPVUrk2qiHOw
         ZE1nO6JN5mXBFOLADVvlUxOYZapzXU+ZeE9Zkkwc1wGAXIkfT77H7Sgg3pCR1rd1OFMu
         rEXA==
X-Gm-Message-State: AC+VfDwDurOUfihMXeMFGKJbcXYBEAVxBccy+x01nPIHnWyxysvDSd10
	FwDxNYiOTnRe6DkyjpXUuFejbK2sdgg=
X-Google-Smtp-Source: ACHHUZ6pUVtfnjx3yCSyP11V3DoOQqy3SF3n3ZcLqHfmDMnSaaQgXO4Z1nHM4fwjQoyk8033mvq5hQ==
X-Received: by 2002:a17:902:b198:b0:1a1:b174:836c with SMTP id s24-20020a170902b19800b001a1b174836cmr1001919plr.16.1683140440270;
        Wed, 03 May 2023 12:00:40 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9390:e396:49ef:54dc])
        by smtp.gmail.com with ESMTPSA id be12-20020a170902aa0c00b001a6a53c3b04sm21958039plb.306.2023.05.03.12.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 12:00:39 -0700 (PDT)
Date: Wed, 3 May 2023 12:00:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Limonciello, Mario" <mlimonci@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Chuanhong Guo <gch981213@gmail.com>, linux-input@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [regression] Bug 217394 - IRQ override skipping breaks the Aya
 Neo Air Plus 6800U keyboard buttons
Message-ID: <ZFKvVKMesT+3NthN@google.com>
References: <01ea5c8e-ed2f-7568-f6ed-896329e7b673@leemhuis.info>
 <68d017d9-d815-01d4-23c1-49c0aaf5f20b@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68d017d9-d815-01d4-23c1-49c0aaf5f20b@amd.com>

On Wed, May 03, 2023 at 11:11:33AM -0500, Limonciello, Mario wrote:
> +linux-input
> 
> On 5/3/2023 7:58 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
> > Hi, Thorsten here, the Linux kernel's regression tracker.
> > 
> > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> > kernel developers don't keep an eye on it, I decided to forward it by mail.
> > 
> > Chuanhong Guo, apparently it's cause by a change of yours.
> > 
> > Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
> > not CCed them in mails like this.
> > 
> > Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217394 :
> > 
> > >   Matthew 2023-05-03 02:28:33 UTC
> > > 
> > > Reverting the changes found in this patch fixes the issue:
> > > > https://lore.kernel.org/all/20220712020058.90374-1-gch981213@gmail.com/
> > > With that patch the AT Translated Set 2 Keyboard doesn't show up with the evtest and is not usable.
> > > 
> > > Hardware:
> > > 
> > > Aya Neo Air Plus
> > > AMD Ryzen 7 6800U
> > See the ticket for more details.
> > 
> > BTW: there apparently is another IRQ override needed for a different
> > machine. See https://bugzilla.kernel.org/show_bug.cgi?id=216804#c8 for
> > details (ignore the comments before that, the quirk entry for that
> > machine was merged; comment 8 and all related to it really should have a
> > separate bug; that's also why this partly fall through the cracks here
> > :-/ ). The user is currently trying to create a patch.
> > 
> Something I'm wondering about is if it's possible for i8042 to detect the
> polarity is incorrect when it probes and
> to try to correct it.
> 
> If we could do that we can probably drop 9946e39fe8d0 ("ACPI: resource: skip
> IRQ override on AMD Zen platforms")
> to fix this issue along with all the other quirks that have collected over
> time on i8042 polarity issues.
> 

8042 is shared between multiple platforms and is quite fragile as it is.
If there are issues in AMD firmware and you know the polarity that is
needed for 8042 on these platforms you should add a proper fixup for
override. Maybe you should only skip override for IRQ 1?

Thanks.

-- 
Dmitry
