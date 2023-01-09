Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D43E8C09
	for <regressions@lists.linux.dev>; Mon,  9 Jan 2023 20:23:20 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id s67so6704258pgs.3
        for <regressions@lists.linux.dev>; Mon, 09 Jan 2023 12:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k41astqjkDyXguuysItAsqgOzPzji5WGOG6yqrMIR6k=;
        b=jeu50SsSFVrdADFjU6kijbm0cAcXPMedMsmb2QbhPtxl9CinvJ/PFLe+ri117asn+I
         e4xqIotyJcK6cpEmNxseHBnVzJcmYHNcAZUhMzik9dFPwVSe4l2Pme/61j6JMXwZY0oh
         vTzkLOb2aYvLFsR5eEccDnyV8CKnlbO2iQ6MyAliTe0J9j2kaaBpagGNwwNz8zrkukgM
         B1v5n8AzI3BLRjWSDL5RiUYWWtEupgL6oezkacX4R+k9gTzAU706uTGqowM5UfGfZ7Va
         9PTgZmIifLWvheSFmgDWJmog41c8//nln9HEZZqHM1Mh5dNvF1tBV7xn9TtQzzYpvuQc
         6Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k41astqjkDyXguuysItAsqgOzPzji5WGOG6yqrMIR6k=;
        b=IXlzOHWN6j3/XryddRLVySyp6yBOjRLUmtjJHgLrjduddJ1kV7YDpHQoIH0oJk1XMG
         ObnpjfNoLVzD9+8LcBuq1oOyd5Zr2ZsExx0os0n8Z76kzbSGGK2PE1pZtTF9rckD0Ls4
         ZYP3QvndbpGm+jz+8i2Pp83K0Ldu3fzGMGFArSeaPvtdCnhfunizB+lDxpJ6oRpl+3y9
         mdr55FC06o1ZWAxraLit7QpGYxl1sHED/Vb9QF/LUSgjOA4pnVDbMEwnUh4IXJqo/aB8
         qT4UruuglLdnm+bQPXiIBXQsZy8jrpVgmCl+3YMBrndQifXgvurItETbR+XEr/p06zY1
         ne4A==
X-Gm-Message-State: AFqh2kq+7lp4LdMLDkoUSl5+HAykT3xq8oJt1TXs9hVHZ4SNwL1r2aOv
	OQOSABxeTQMNfW8LhrRBjQ5CVKE0O9fPjoscDog=
X-Google-Smtp-Source: AMrXdXt6yaVDPXJ7aGezhzNAQ+TlnsUhUqPU9uInhbGDl9V44P0F9SDwrXljuK8SibkvXehK7ip+1iXTIc2GxNfqT24=
X-Received: by 2002:a62:7bd2:0:b0:587:d04c:851a with SMTP id
 w201-20020a627bd2000000b00587d04c851amr594715pfc.53.1673295799484; Mon, 09
 Jan 2023 12:23:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
 <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
In-Reply-To: <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
From: Youssef Aly <youssefaswad@gmail.com>
Date: Mon, 9 Jan 2023 22:23:07 +0200
Message-ID: <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
To: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Dadap <ddadap@nvidia.com>, regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hello Hans,

Ok, I'll try building with the patch you provided, and report back.

Thanks,

Youssef

On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Youssef,
>
> On 1/9/23 17:18, Youssef Aly wrote:
> > Hello,
> >
> > The backlight control has been broken on Dell G15 5515 since 6.1, it
> > is always at full brightness, this is only the case in hybrid (mux)
> > graphics mode.
> >
> > As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
> > nvidia_wmi_ec_backlight    16384  0
> > video                  61440  5
> > nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
> > wmi                    36864  7
> > video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
> >
> > but it is not present in /sys/class/backlight, only amdgpu_bl1 is
> > present which is not functional
> > contents of /sys/class/backlight
> > total 0
> > lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
> > ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> >
> > this is the content on 6.0.12
> > total 0
> > lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
> > ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> > lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
> > ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
> >
> > Distro: Endeavour OS
> > Kernel: 6.1.4-arch1-1
> > GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
> >
> > #regzbot introduced v6.1..v6.1.4
>
> Hmm, this is likely caused by:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
>
> Which was added because according to the reporter on their G15 5515
> backlight control only works in native mode ...
>
> I'm getting the feeling that we need to detect the BIOS setting
> and use a different backlight device depending on the setting...
>
> Daniel, any ideas?
>
> For now can you try building a kernel with the attached patch
> (which I've also just submitted upstream) and with:
>
> acpi_backlight=nvidia_wmi_ec
>
> added to your kernel commandline. That should work around this
> for now...
>
> Regards,
>
> Hans
