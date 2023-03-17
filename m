Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA33377
	for <regressions@lists.linux.dev>; Fri, 17 Mar 2023 01:38:39 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id q42so2421870uac.3
        for <regressions@lists.linux.dev>; Thu, 16 Mar 2023 18:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679017119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gZiMCDMIqB6OVa8oI0SbxOaqsvPFfiDjO4dIGyuTuIg=;
        b=ypwhZFcEyECXNJLrPmBrQBRxwV+y3VDSUZRidDldPrMlkddN8UY8Sd09RHpaiqdiJL
         T7ZnlEx7oQHOvemcAeJimox6CqBwQt5mA6I5dl4zxVDLl84vlluYmnsW3XrJAq59rLmm
         WEPR9GDZf3CMjIEeQ1ImdBuXtn3KtyXxGhGeEnmEZS0j2sqwdmlAlzOwUzK6i/XefAY5
         7Y1tBOyhxN8wEoGSg6Y+f7V7aOput026rhrRVSliNNxcqNUPXZI8t7s/BGDZ4fpJznF2
         a4wY+SXlfzZfwhEPy83h/v6w/SWGnfBLCXxitQ0B/IYAlEUQxW78axaN7PPFkDGCimfx
         W+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679017119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZiMCDMIqB6OVa8oI0SbxOaqsvPFfiDjO4dIGyuTuIg=;
        b=UoyfUYSIHR+C7HKXJEePdlyJtk4XY+BFtwll0a5JJwRuMHkGUZXwku9xnpdvc9wcec
         KKoNshLgkRyvDa07Nt1EzXGcxowX5sKbIyRdCbF4kN1LDjyU2NmHr2OrfgLQISU3TqVf
         /0mzFcJQt5omj6HKEzP1ZvjknB0vZHiL5VRpKdXUwh1hmUr6kF0DRbwPdzhH4BEvUQkx
         e/GLC39R2j9gOunyCoAXurY1DtyMCV+qoJrzWNyo6FYJw38lo8UWgeYOw+GmuikSFbdr
         RWgvLAFYpgZP3cw1bz7ZlqKLy2FI5139M5O7u3o0HPgYHFiS36C19o1lqnh1YhmxL8dA
         /Uhw==
X-Gm-Message-State: AO0yUKVkWX49k/G5WNm7eOiNEIXEvQeSe57zHmOlZiZQFo2WGWMc87NP
	yzHEepbqHYliMRKUNBKnK9/Za27fcOUGNunLj/dXRQ==
X-Google-Smtp-Source: AK7set+/q/KOu9X2oqklAu82mx0ZTERuPycsI3lxx4LB0u576R4uCrwSrRzaoqbLzoyXIBsLOflo4MZ1GqF/8zksvhU=
X-Received: by 2002:a1f:b292:0:b0:42d:18f9:d0b6 with SMTP id
 b140-20020a1fb292000000b0042d18f9d0b6mr18388753vkf.2.1679017118886; Thu, 16
 Mar 2023 18:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230314230004.961993-1-alexey.klimov@linaro.org> <c98a3741-273b-8a69-016d-5f3e79f8a71e@acm.org>
In-Reply-To: <c98a3741-273b-8a69-016d-5f3e79f8a71e@acm.org>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 17 Mar 2023 01:38:27 +0000
Message-ID: <CANgGJDqhimVZ7Pfes0sT8S2VHo_gTLBYkGFNcfbT5CV5VJz51Q@mail.gmail.com>
Subject: Re: [REGRESSION] CPUIDLE_FLAG_RCU_IDLE, blk_mq_freeze_queue_wait()
 and slow-stuck reboots
To: Bart Van Assche <bvanassche@acm.org>
Cc: peterz@infradead.org, draszik@google.com, peter.griffin@linaro.org, 
	willmcvicker@google.com, mingo@kernel.org, ulf.hansson@linaro.org, 
	tony@atomide.com, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	axboe@kernel.dk, alim.akhtar@samsung.com, regressions@lists.linux.dev, 
	avri.altman@wdc.com, klimova@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Mar 2023 at 23:21, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 3/14/23 16:00, Alexey Klimov wrote:
> > The delay is found to be in device's ->shutdown() methods called from kernel_restart():
> > void kernel_restart_prepare(char *cmd)
> > {
> >       blocking_notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd);
> >       system_state = SYSTEM_RESTART;
> >       usermodehelper_disable();
> >       device_shutdown();      <---- here

[..]

>
> Please let me know if you want me to resubmit patch "scsi: ufs: Remove
> the LUN quiescing code from ufshcd_wl_shutdown()"
> (https://lore.kernel.org/linux-scsi/20220331223424.1054715-14-bvanassche@acm.org/).

This indeed works and helps to reduce reboot time. Thanks!
If you decide to resubmit, feel free to ping me to test it.
However I have no knowledge how comments from Adrian can be addressed.

With that patch the reboot time decreases from 60-100 seconds to
~10-20 seconds. The next
"slow" thing is wlan driver which callback is called from
blocking_notifier_call_chain(&reboot_notifier_list, ...) but obviously
it is not a part of ufs code.

Best regards,
Alexey
