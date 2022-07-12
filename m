Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F01C23AA
	for <regressions@lists.linux.dev>; Tue, 12 Jul 2022 03:05:22 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id bf9so11727237lfb.13
        for <regressions@lists.linux.dev>; Mon, 11 Jul 2022 20:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YoTTltPsqg9i+vMO+2k1XGkEPtLOgLm70bL2HmR/2po=;
        b=L6D6YTRAzy4tsp2EqX9g3Pk80hDnEM50H6fw1xDnXl5xIvTD7LzrRgDc4TA7g7o1nt
         N0zek6j/tvgUkIvbaQ4XRjTy0c2VoL9HfZ5dFNbi3bfUYB11h+zYy8oXwyrlP3k7Arie
         L/+SD0hVQaDQpEWZR6eYI7g+umKighuZjiGreR984GfblGchXCI3bn/Xc+q/LbQCIJJn
         4Co8InrYn1Rf4OodkJmKr86TAI97D4TF4vZe1gAHC+JOOVK4s31hXuQW21elj+OtpuQt
         XN4wwhZbYS/gY9JHd/+1mboTr1Mllc2ugxAmqm0hHwImln39Umn/5CSmyhUes1tRDEBw
         btJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YoTTltPsqg9i+vMO+2k1XGkEPtLOgLm70bL2HmR/2po=;
        b=L2HRTzKEgrL7bjcdmrk8ApAAomA5MiDbqZqT2aHl6jcH0mr2+SMw5dl0FSL/0y2dC0
         ExDCGldt3CyoApEOI7+5RdtX+4WHDN8OzTtFOsdnuVCQ+CiNp6U4R3N4QEXsq3KLU/F/
         QDsaLigouMOoVoXcTaoGzjfsWYlbV89vFtYwRQ/R8/J3lgPOZahCCEVD5F3N3WivlWa3
         AKTZogbXGv0yRet7j714w/7S1RnBnGEgon2jSbcpLYPWvZWeQBaDyJjClzJ4C96Ecn3K
         rc7hPsr+ULCwH8HrsdsbeGawY3gxhQFHq2wAICPFGNLWWKLeObSPWr5CljR3io1Bl7yz
         0fcA==
X-Gm-Message-State: AJIora90TwGe+Ajsfxo+v/uU1g837dL6Unlxz70tGWDz1ELHmZfLKkYz
	SlbBhpio1VQC4JEReKSzQlJaC5zV+dvEinqhYFs=
X-Google-Smtp-Source: AGRyM1vh5CLlDcDB4y/T06kpLm0eXF+Zwt32CXlwZERnHuT1IBZ8LUmvNecrk1cWT0INXt1bicXwGKCb+jJUbKK+g/A=
X-Received: by 2002:ac2:4288:0:b0:489:da8b:293a with SMTP id
 m8-20020ac24288000000b00489da8b293amr6007885lfh.106.1657595120089; Mon, 11
 Jul 2022 20:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <db3b4f30-cd32-fa24-5ed0-038d4925860f@molgen.mpg.de>
In-Reply-To: <db3b4f30-cd32-fa24-5ed0-038d4925860f@molgen.mpg.de>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 11 Jul 2022 20:05:07 -0700
Message-ID: <CABBYNZKibt14eHLFMUre9CZ+XNmUvsh_BNaDz+LzDtHB0NMBDQ@mail.gmail.com>
Subject: Re: [REGRESSION] hci0 hci_power_on [bluetooth] blocks for more than 2
 min preventing suspend and shutdown
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, linux-wireless@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, Jul 11, 2022 at 12:14 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Linux folks,
>
>
> On a Dell Latitude E7250 with
>
>       Bus 001 Device 003: ID 8087:0a2a Intel Corp. Bluetooth wireless
> interface
>
> with Debian sid/unstable upgrading from Linux 5.18.5 to 5.19-rc4 results
> in a regression, where the system does not suspend or does not power
> off. Linux logs earlier:
>
> ```
> [  242.677813] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  242.677818] task:kworker/u9:1    state:D stack:    0 pid:  379 ppid:
>     2 flags:0x00004000
> [  242.677831] Workqueue: hci0 hci_power_on [bluetooth]
> [  242.677934] Call Trace:
> [  242.677938]  <TASK>
> [  242.677946]  __schedule+0x30b/0x9f0
> [  242.677961]  ? enqueue_entity+0x1a1/0x520
> [  242.677973]  schedule+0x4e/0xb0
> [  242.677981]  schedule_timeout+0x115/0x150
> [  242.677993]  ? resched_curr+0x20/0xb0
> [  242.678004]  ? preempt_count_add+0x68/0xa0
> [  242.678013]  __wait_for_common+0x93/0x1d0
> [  242.678022]  ? usleep_range_state+0x90/0x90
> [  242.678034]  __flush_work.isra.0+0x160/0x220
> [  242.678044]  ? flush_workqueue_prep_pwqs+0x110/0x110
> [  242.678052]  __cancel_work_timer+0x104/0x190
> [  242.678060]  ? led_trigger_event+0x1d/0x60
> [  242.678067]  ? led_trigger_event+0x1d/0x60
> [  242.678073]  hci_dev_close_sync+0x27/0x540 [bluetooth]
> [  242.678183]  hci_dev_do_close+0x26/0x60 [bluetooth]
> [  242.678253]  hci_power_on+0x8c/0x260 [bluetooth]
> [  242.678337]  ? __schedule+0x313/0x9f0
> [  242.678347]  process_one_work+0x1e5/0x3b0
> [  242.678357]  ? rescuer_thread+0x390/0x390
> [  242.678364]  worker_thread+0x50/0x3a0
> [  242.678373]  ? rescuer_thread+0x390/0x390
> [  242.678380]  kthread+0xe8/0x110
> [  242.678387]  ? kthread_complete_and_exit+0x20/0x20
> [  242.678394]  ret_from_fork+0x22/0x30
> [  242.678409]  </TASK>
> ```
>
> `sudo modprobe -r btusb` also hangs:
>
>       [ 4115.987537] usbcore: deregistering interface driver btusb
>       [ 4116.128277] Bluetooth: hci0: urb 00000000434e95f7 failed to
> resubmit (2)
>
> Please find the output of `dmesg` attached.

https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/commit/?id=e36bea6e78ab2b6c9c7396972fee231eae551cfc


-- 
Luiz Augusto von Dentz
