Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C601094D
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 12:23:32 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-c5e76dfcc36so5426202276.2
        for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 05:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688991812; x=1691583812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D5wpUGcoCMLJktVtdk3pDx8grpN6B5CCP4ofqZN22Ns=;
        b=ocuAjur8c/g9aUvJT2WR3TfZAzQu4EnTUMo6UB4meKF3y4D2+ka8nTVf/Vhb60o4hr
         WwXb78+52KfjNDzUyweIoufpkr/Er+ng7kY/r4h05JkVxgCsya6DQRp4eRW307L/4/rW
         wrJCv2Tdl3iVrIqR6SgqgOA5aW5UZI3hjCT516SMj4/PqL2st3hc7ZwZgW7gMGXrG/pv
         T1NkTZpXq6BkOa9Q4IjsY1ReLnGy0NsuZnH7N8nEBpbYH6i/fkNiSvkERtIQlrs7naTx
         TsTQNXBzKS5dfnmrXmhWgmfED08ndpUUawf7HCVOVAyqdWPrFw7Qi6QXsVYiNK8ulRJL
         Rv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688991812; x=1691583812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5wpUGcoCMLJktVtdk3pDx8grpN6B5CCP4ofqZN22Ns=;
        b=bTd7dVigvjKwPnb/jI4sRKdLIaP2KQsinM9zJrT8gpZJZrQL9H5RKCY518/UDdKaNF
         RFnZf6Z4JHiTo6WcCRTaN6u0jpESUxF5YJhS+OixTnsZge1PxiNbaNWpcYHH6Wo1dnMe
         /hP+j5N33pCpAzPmviZPEvAl1DFevw7tT6W/s1lhZp5NFrshS+Bq9/L0nFd8miff91Fe
         Jw0FigpJW9CEifBwpYjtn+kfjKQWI3ObbctlXodwj7ETbRJ0JXZA0seXQML0q/ny5VV0
         YG+b9I3WerLMLbE8/Nd0TKvEw1ZcRvtb7Jocfp0EI2tmWP7cnZdfIc1VrpMaoWJpsjB3
         fy2Q==
X-Gm-Message-State: ABy/qLZFpZJx45uAhxuqrL/ICivexN8BQAsGPMAU5KEdNMs0vqKec0Uj
	bzyOisw/dU0iMzlqQcLVFtAz08sK3IQJXrHzudu/TA==
X-Google-Smtp-Source: APBJJlHupZJB9Sam/r2Z4m1rFw/1XEugNXZQqU3G9JkRqCdzFkoSQ+aCNbEcwdZgIfayhMA1sxapEfL1iViYtUhPMwA=
X-Received: by 2002:a81:5354:0:b0:576:de5d:164e with SMTP id
 h81-20020a815354000000b00576de5d164emr13041207ywb.23.1688991811684; Mon, 10
 Jul 2023 05:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531090424.3187-1-johan+linaro@kernel.org>
 <20230531090424.3187-3-johan+linaro@kernel.org> <CAMi1Hd3fe=wk02WG8J7K5Ud1GcWkuKKKrxFjkNguxDkzNz2WVQ@mail.gmail.com>
 <ZKfyH4jRGlVlcLeY@hovoldconsulting.com> <CAMi1Hd2CGQKbMPm6GXfSHgrdHsyngBQ_DBseF08=oEvGdizVcw@mail.gmail.com>
 <ZKvvN53dM5vbAFGi@hovoldconsulting.com>
In-Reply-To: <ZKvvN53dM5vbAFGi@hovoldconsulting.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Mon, 10 Jul 2023 17:52:55 +0530
Message-ID: <CAMi1Hd3-iiNYfSyrvXpsjEFQ+_PzR_WJPoDEbcnAvH+Q1O_Pmw@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] Bluetooth: fix use-bdaddr-property quirk
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Jul 2023 at 17:14, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Jul 07, 2023 at 07:12:35PM +0530, Amit Pundir wrote:
> > On Fri, 7 Jul 2023 at 16:37, Johan Hovold <johan@kernel.org> wrote:
>
> > > That's odd. You should still see the above messages also with this patch
> > > applied, but you may now need to provide a valid device address before
> > > being able to use device in case the bootloader has not provided one
> > > (e.g. using btmgmt).
> >
> > Sorry for the confusion, I missed the part where I do see these
> > messages when the kernel module is loaded but the direct firmware
> > loading fails.
> >
> > Bluetooth: hci0: setting up wcn399x
> > Bluetooth: hci0: QCA Product ID   :0x0000000a
> > Bluetooth: hci0: QCA SOC Version  :0x40010214
> > Bluetooth: hci0: QCA ROM Version  :0x00000201
> > Bluetooth: hci0: QCA Patch Version:0x00000001
> > Bluetooth: hci0: QCA controller version 0x02140201
> > Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
> > bluetooth hci0: Direct firmware load for qca/crbtfw21.tlv failed with error -2
> > Bluetooth: hci0: QCA Failed to request file: qca/crbtfw21.tlv (-2)
> > Bluetooth: hci0: QCA Failed to download patch (-2)
> > Bluetooth: hci0: QCA preshutdown_cmd failed (-56)
> >
> > This happens in all the cases (working and non-working BT) because
> > filesystem is not mounted by that time. I'm running AOSP and all the
> > kernel modules get loaded from a ramdisk. But in the working case, the
> > firmware loading kicks in again later in the boot process and BT gets
> > initiazed..
> >
> > With this patch, after the first attempt to load the firmware fails,
> > the firmware loading doesn't kick-in again. Also even if I keep the
> > firmware in ramdisk then the direct firmware loading from ramdisk
> > happens but BT still doesn't work
> > https://bugs.linaro.org/attachment.cgi?id=1148.
>
> So everything appears to work as intended. First, the firmware needs to
> be in your initramfs if you want to avoid that initial fw load failure.
>
> And after that you need to provide a valid device address as these
> devices ship without one.
>
> Once you set the address, the firmware should be loaded if it hasn't
> been already.

Thanks a lot for explanation Johan. I just booted up Debian on DB845c
and btmgmt works as you pointed out above.

root@linaro-gnome:~#
root@linaro-gnome:~# uname -a
Linux linaro-gnome 6.5.0-rc1 #1 SMP PREEMPT Mon Jul 10 15:42:50 IST
2023 aarch64 GNU/Linux
root@linaro-gnome:~#
root@linaro-gnome:~# btmgmt public-addr 01:02:03:04:05:06
[  165.708146] Bluetooth: MGMT ver 1.22
hci0 Set Public Address complete, options:
[  165.715275] Bluetooth: hci0: setting up wcn399x
root@linaro-gnome:~# [  165.868755] Bluetooth: hci0: QCA Product ID
:0x0000000a
[  165.874272] Bluetooth: hci0: QCA SOC Version  :0x40010214
[  165.879758] Bluetooth: hci0: QCA ROM Version  :0x00000201
[  165.885226] Bluetooth: hci0: QCA Patch Version:0x00000001
[  165.903506] Bluetooth: hci0: QCA controller version 0x02140201
[  165.909424] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
[  166.794992] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
[  166.870882] Bluetooth: hci0: QCA setup on UART is completed

>
> > > Are there any error messages in the log when running with this patch?
> >
> > I don't see any relevant error message in dmesg. I'll check if I can
> > find a command line BT debug tool which I can use on AOSP for
> > debugging. There used to be a few hci command line tools, when I
> > looked into it a few years ago. Not sure if they are still around and
> > useful.
>
> Yeah, I'm not sure how you set the device address with the Android
> stack, but there must be some way as there are other bluetooth
> controllers out there which similarly need a valid address before they
> can be used.
>

I'll look if I can reuse/simplify "btmgmt public-addr" command on
Android or find an equivalent tool to do that.

Regards,
Amit Pundir
