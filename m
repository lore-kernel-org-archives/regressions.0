Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5547817D0
	for <regressions@lists.linux.dev>; Mon,  8 May 2023 15:18:01 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-52160f75920so3096827a12.2
        for <regressions@lists.linux.dev>; Mon, 08 May 2023 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683559081; x=1686151081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ddVg5NwpexUXVTyyMr05Lwv6CZGiw2vqLYMkPFFIBYQ=;
        b=JOt53aFzZR9CZNQIoTICa+8Nc75Sx6hdN4ogm7btYica7EBns7zTHkPa65XqoCIUeM
         bZTOBlbKlRBdAFj30NcgOexEqu2h9/HWl8WZg8sG6dVHhIdVPK7u79Q/WlwTdz6N7Q7W
         Ou61NmkStKfOU4b38Gdh1beRn9F6UAstyLWq2pplwciiezAn3rtdQUT7v6jE1yO7e/Cb
         FZTd+hGxLp7NF+hYGv3bpN567IpMP1jKhTTQXVwXU0qXIJsStO/Se5xftXIIsZTPp3md
         ME+UXt+oWYhyJKKi/bug8KX0dilegSs1DiOg7YSmcX8nNxNx8uOtEDIfGAilh2Ns22Fn
         rUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683559081; x=1686151081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddVg5NwpexUXVTyyMr05Lwv6CZGiw2vqLYMkPFFIBYQ=;
        b=d2m7lOUUn3BaaZ1WQCV9gaC0GQTXyGu62FbzU12gbguXOx7Wbhjaomk16BkwBFcWBV
         aTCw5aZw28cV5loyZz3r8hLUwzikR6+pblwc1IzpqvtnLkc8m0k58Y+p7Clzg8/tiGQd
         bYJixCWGHKsYuQJaeQb94y+yMvl7XYJI+6U5HbFvBspfO8ZZFCUj0zmCbRkV5f2ndsut
         /PDfvp0qUt/M+f3bfKveXQuttcouSGH4NCy6muEz9NcV4Fwg4dpCMjIV+gd+CQyaxkle
         o9+hqGTaT3ZgGAZ3h0H3ffH2S2XVO5RJjXBpTF+anvo88KPt0IqbdhZ17tWke8jdWnLb
         bdDg==
X-Gm-Message-State: AC+VfDyxxJFRSRpuKxLSWs4RPkk5QcHuWdbpkANEoBl0oKrC7y5URwDO
	o/80aTVylkeG1KLFKo+VqpUIUGGJO4w=
X-Google-Smtp-Source: ACHHUZ6RD4eTgwFtetlrlNU3p6Jd4rK3oGhwkiuhLUv8Z5bGlLP50566XiXLBq7PoeKqK10zc71bdg==
X-Received: by 2002:a17:90a:af86:b0:250:5194:b135 with SMTP id w6-20020a17090aaf8600b002505194b135mr7136903pjq.34.1683559080588;
        Mon, 08 May 2023 08:18:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4d1:db5a:dbba:cd34])
        by smtp.gmail.com with ESMTPSA id n21-20020a17090a929500b0024de93877acsm9944960pjo.47.2023.05.08.08.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 08:17:59 -0700 (PDT)
Date: Mon, 8 May 2023 08:17:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"Limonciello, Mario" <mlimonci@amd.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Chuanhong Guo <gch981213@gmail.com>, linux-input@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [regression] Bug 217394 - IRQ override skipping breaks the Aya
 Neo Air Plus 6800U keyboard buttons
Message-ID: <ZFkSpOpPpwJqpJHI@google.com>
References: <01ea5c8e-ed2f-7568-f6ed-896329e7b673@leemhuis.info>
 <68d017d9-d815-01d4-23c1-49c0aaf5f20b@amd.com>
 <ZFKvVKMesT+3NthN@google.com>
 <5df240d4-03f1-31cd-03e1-a6cfddd5cc1d@leemhuis.info>
 <f60edac7-8ba9-216e-568b-2fb2aeb72cfb@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f60edac7-8ba9-216e-568b-2fb2aeb72cfb@amd.com>

On Sun, May 07, 2023 at 07:45:01AM -0500, Mario Limonciello wrote:
> 
> On 5/6/23 01:47, Thorsten Leemhuis wrote:
> > On 03.05.23 21:00, Dmitry Torokhov wrote:
> > > On Wed, May 03, 2023 at 11:11:33AM -0500, Limonciello, Mario wrote:
> > > > On 5/3/2023 7:58 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > > > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> > > > > kernel developers don't keep an eye on it, I decided to forward it by mail.
> > > > > 
> > > > > Chuanhong Guo, apparently it's cause by a change of yours.
> > BTW, there is another report caused by the change:
> > https://bugzilla.kernel.org/show_bug.cgi?id=217406
> > 
> > ```
> > I have an HP Pavilion Aero 13 laptop that comes with an AMD Ryzen 7735U
> > CPU and an up-to-date BIOS. Using any kernel version that is strictly
> > greater than 5.19.9 on it is causing the typing with the integrated
> > keyboard to be extremely slow. "Slow" is subjective but let's say [...]"
> > ```
> > 
> > /me wonders how many machines out there show problems we never hear about
> > 
> > Anyway:
> > 
> > > > > Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
> > > > > not CCed them in mails like this.
> > > > > 
> > > > > Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217394 :
> > > > > 
> > > > > >    Matthew 2023-05-03 02:28:33 UTC
> > > > > > 
> > > > > > Reverting the changes found in this patch fixes the issue:
> > > > > > > https://lore.kernel.org/all/20220712020058.90374-1-gch981213@gmail.com/
> > > > > > With that patch the AT Translated Set 2 Keyboard doesn't show up with the evtest and is not usable.
> > > > > > 
> > > > > > Hardware:
> > > > > > 
> > > > > > Aya Neo Air Plus
> > > > > > AMD Ryzen 7 6800U
> > > > > See the ticket for more details.
> > > > > 
> > > > > BTW: there apparently is another IRQ override needed for a different
> > > > > machine. See https://bugzilla.kernel.org/show_bug.cgi?id=216804#c8 for
> > > > > details (ignore the comments before that, the quirk entry for that
> > > > > machine was merged; comment 8 and all related to it really should have a
> > > > > separate bug; that's also why this partly fall through the cracks here
> > > > > :-/ ). The user is currently trying to create a patch.
> > > > > 
> > > > Something I'm wondering about is if it's possible for i8042 to detect the
> > > > polarity is incorrect when it probes and
> > > > to try to correct it.
> > > > 
> > > > If we could do that we can probably drop 9946e39fe8d0 ("ACPI: resource: skip
> > > > IRQ override on AMD Zen platforms")
> > > > to fix this issue along with all the other quirks that have collected over
> > > > time on i8042 polarity issues.
> > > 8042 is shared between multiple platforms and is quite fragile as it is.
> > > If there are issues in AMD firmware and you know the polarity that is
> > > needed for 8042 on these platforms you should add a proper fixup for
> > > override. Maybe you should only skip override for IRQ 1?
> > Stupid question from the peanut gallery: does anyone know what Windows
> > is doing on those machines? I wonder if this is one of those situation
> > where we just must follow suite to make things work reliably long term
> > for users, even if that might mean 8042 needs to be modified.

Maybe Windows simply selects "falling edge" trigger in the driver? They
do not need to deal with multiple atchitectures, so it may work for
them.

> > 
> > Or is the problem likely to go away with new hardware?
> > 
> > Ciao, Thorsten
> > 
> > P.S.: BTW:
> > 
> > #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=217406
> I've got the same question.  This issue doesn't happen in AMD's
> reference platform; it's not in AMD's firmware.
> It seems to be happening in some OEM platforms only.
> 
> Dmitry,
> 
> Can you think about what a polarity detection scheme would look
> like for i8042?  If it's put in the error path (device not responding to
> probe)
> I would think it should be relatively low risk to otherwise working
> hardware.

Mario, I feel strongly that this kind of kludges belong in the platform
handling code. If you know the polarity of keyboard interrupt on AMD
platforms and that it is sometimes described incorrectly in the firmware
you should fix it up in the code that deals with the firmware.

We have some code trying to test AUX interrupt and it has all kinds of
exceptions because many ECs do not implement AUX LOOP command properly,
on some the interrupt is not delivered for the LOOP command and so
forth. It is a disaster. I shudder to think about trying to use KBD
LOOP.

Thanks.

-- 
Dmitry
