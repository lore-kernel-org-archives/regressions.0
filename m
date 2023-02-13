Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6719A15A6
	for <regressions@lists.linux.dev>; Mon, 13 Feb 2023 02:57:47 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id v13so11031038eda.11
        for <regressions@lists.linux.dev>; Sun, 12 Feb 2023 18:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hw9ehYVDq4moKFFfu+9OhsPZCy7y23ffO2nBq/yLrA4=;
        b=PJrSank/HxSMunzkm1fR5tYP9U7Z8BvPW9A0/ge4QaohJG+zg4gfB+0kLZNR8O8w0c
         rgGY+nFWRqAsO3bYR6kaqoVXT4XmhFi64UVXIdHTJUCyjsfzNy/B62cITCl1m7k5vTVE
         jLhNCEt19V+6WoPstiHKU9RVs8lJP7hNDffQACva4go52M5BuI/HxdQiqIhXVE+eHtyz
         Exj9shR338hQzgVtytzQXCQYY8tHAMPnxKo8kiGejAKh40Uiu2TTUlVr+PRLg5dUZ4Ic
         epiynC1faSejQjvJCGQETmrp6DHmy8ZsHkaHjZlVliJalnkLnbm8vI7q24DLf1fhdF5h
         IxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw9ehYVDq4moKFFfu+9OhsPZCy7y23ffO2nBq/yLrA4=;
        b=2AFtU5c56UFPgCbkEc8XEubdG1ZDrc9Vd9QZhqNXR5nEYT7Ok0mjAXl6l3OU1uIlOE
         fD14kwqyj0hVa79Uiu00ARqGGjbo92GyIPQSxv7koHRrIFlW7xyAXqerDT6mNUKBWn+Y
         +KAnm9W4rk7antLkKbQpbZn+hyOo4tMGo6jBRQoBMSkLjJi8iH8dWPGYLxksktW3gsre
         shnsupu0vbHP21F8X7s0BSvaF5jZPdRY0PJOelzFbB4pN2Zks8GoN6UNLFrPqemAz8iT
         uz48y8+Hryr9VvxGuJABkMlxdBUTlxCXajh9KyrVqctQtZVmAK+1rrhHehmUHdorFW/X
         3Bqg==
X-Gm-Message-State: AO0yUKUQAQ84u6ZIGi2wceQP/OgvglKeDOedBg0Zm+mMebMcBiCE2yPI
	IrDaQ+yB3LYsJxxXf7T62Z/usoVSF79okpcdQlX29uFGyQ4=
X-Google-Smtp-Source: AK7set9mBuQIrk3oO2rWHodC/1gO5O/yOJ2sf/e+WQ0l7IxCo7aLgd6UYYj2pbnhDI/nTsLxr8j0ivM4KjuT+dYQTxY=
X-Received: by 2002:a50:9eee:0:b0:4aa:a4f2:ca1a with SMTP id
 a101-20020a509eee000000b004aaa4f2ca1amr5993822edf.0.1676257065447; Sun, 12
 Feb 2023 18:57:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info> <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
 <3ab28896-70e9-6f90-5b97-e5397b06e715@googlemail.com> <a163dd7b-c5d1-a07b-a816-7a2dfd3edfd4@leemhuis.info>
 <ab1b0f73-6b4e-8602-2999-b7bec25d92db@googlemail.com> <CACAvsv4sOtPjCVnEcKd2RCUqYWxSn5XKyksbS-Bds2qCqyusVw@mail.gmail.com>
 <1cdb84ac-f7a8-66ba-98fc-3db302b49a5a@googlemail.com> <dab6eb81-db3f-8fa1-84ad-9b40e209514b@googlemail.com>
 <CACAvsv5iYdF3P8AbyrbYo3zGmYRYhxDWn7WbAR5V9qHpbgBXRA@mail.gmail.com>
 <1632a9ef-2954-c8f0-cdc9-03157c9d8547@googlemail.com> <5abbee70-cc84-1528-c3d8-9befd9edd611@googlemail.com>
 <5cf46df8-0fa2-e9f5-aa8e-7f7f703d96dd@googlemail.com> <f72fe15b-db1d-56dd-aaf6-3cba68a8bf0a@leemhuis.info>
 <CACO55tvR4ydDOXt=9nbR3n2aFLKrj8zeuGRR_xpezVQBBLrjqg@mail.gmail.com>
 <a6188878-f84c-0fcc-9509-b9d7ab797f4c@leemhuis.info> <d031f0a5-8d5e-af51-6db6-11844de3eeba@googlemail.com>
In-Reply-To: <d031f0a5-8d5e-af51-6db6-11844de3eeba@googlemail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Feb 2023 12:57:32 +1000
Message-ID: <CAPM=9tz+wksJTvMi_4Ef7XWezfH0ReN2se189s8Q=obJjHC+Fw@mail.gmail.com>
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Chris Clayton <chris2553@googlemail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Karol Herbst <kherbst@redhat.com>, 
	Ben Skeggs <skeggsb@gmail.com>, bskeggs@redhat.com, Lyude Paul <lyude@redhat.com>, 
	ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Feb 2023 at 00:43, Chris Clayton <chris2553@googlemail.com> wrote:
>
>
>
> On 10/02/2023 19:33, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 10.02.23 20:01, Karol Herbst wrote:
> >> On Fri, Feb 10, 2023 at 7:35 PM Linux regression tracking (Thorsten
> >> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>
> >>> On 08.02.23 09:48, Chris Clayton wrote:
> >>>>
> >>>> I'm assuming  that we are not going to see a fix for this regression before 6.2 is released.
> >>>
> >>> Yeah, looks like it. That's unfortunate, but happens. But there is still
> >>> time to fix it and there is one thing I wonder:
> >>>
> >>> Did any of the nouveau developers look at the netconsole captures Chris
> >>> posted more than a week ago to check if they somehow help to track down
> >>> the root of this problem?
> >>
> >> I did now and I can't spot anything. I think at this point it would
> >> make sense to dump the active tasks/threads via sqsrq keys to see if
> >> any is in a weird state preventing the machine from shutting down.
> >
> > Many thx for looking into it!
>
> Yes, thanks Karol.
>
> Attached is the output from dmesg when this block of code:
>
>         /bin/mount /dev/sda7 /mnt/sda7
>         /bin/mountpoint /proc || /bin/mount /proc
>         /bin/dmesg -w > /mnt/sda7/sysrq.dmesg.log &
>         /bin/echo t > /proc/sysrq-trigger
>         /bin/sleep 1
>         /bin/sync
>         /bin/sleep 1
>         kill $(pidof dmesg)
>         /bin/umount /mnt/sda7
>
> is executed immediately before /sbin/reboot is called as the final step of rebooting my system.
>
> I hope this is what you were looking for, but if not, please let me know what you need

Another shot in the dark, but does nouveau.runpm=0 help at all?

Dave.
