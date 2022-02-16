Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F6187D
	for <regressions@lists.linux.dev>; Wed, 16 Feb 2022 16:37:19 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id f11-20020a4abb0b000000b002e9abf6bcbcso3130344oop.0
        for <regressions@lists.linux.dev>; Wed, 16 Feb 2022 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QVJo0VFJhyQRasFCmFQo5AdI87REHk9Jchlt43vXjKo=;
        b=o9aG/mtta5HuiQWh325l/DM5Yl1sisnMB3rpsfvhVienTy3bsmwDxOjcDeZQoRuuWl
         VIGNhuDHr8823gONBly/lVupj6Ylp5mNoKXZhiq6GtPQwO/8p2SrawX3HKrvNS+SFU03
         g1P+vRDQvAozJdFedV2PvSDq9mcgsUDfpe1YzEW0FeiJThALWya4GlnuaOyT0MM7Bnj7
         Gsa9S+ydNYpi/XS9X6F1tnglTRIq29AMtX3g2JNP8O+/FVa+r4BuOzO5Izsk0ZmC1zQt
         aVMP7oF6vq5R3JES2jNtFbjyyjiVI2mqQNE8NwvGH/8Rl9aQ3+92iqn66PKMS305SwTH
         GGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QVJo0VFJhyQRasFCmFQo5AdI87REHk9Jchlt43vXjKo=;
        b=WNMhKuBTU+CamegoLJUVSxHsssmvv5m/ZIDONKSKiC9i6m1pajdKW7qEybIiFJ3Nqi
         DSZJJTJ3eGD5K3klSKYx4w97NDq64h8JSiXiCXvz/tZ59ECoEpb8y7KRcGox6EiRSNdx
         6CLa0qMO9vAhslmt35Sl6+hASh/6Mkzm7SAT1GoB9THD84LOiRKAFb2FbUCQSdjYPJgk
         83VW9DZJIR8lgfnsocqk+l9GAtSm9o/BviXq9KMX7v0jPCRzAr6WmrnvQCBXj2SmJBUa
         6k+SJr/2K6s0P+A36v9nb8CWvqckbJl0Os8UEOpbwA+pfbyB7vnxATT6XHRACJp8FqHE
         4kfQ==
X-Gm-Message-State: AOAM530lr7KUb4/yDZ5WB9uVtiFKliWxPX0xcA7QTHjwI+sjpIj6qlVg
	LRC84lMFvAGE3helvqoAyjFerCzEffPkbuLUgCw=
X-Google-Smtp-Source: ABdhPJycQHkXN1b0MoHaobK4fp+okKEzXqgNVm8W8ErlXKTvwdyKfZ9ma3ncW2ari5hRNoahvFdsiOlXkDZ5yGF7YSg=
X-Received: by 2002:a05:6870:912c:b0:d3:44be:7256 with SMTP id
 o44-20020a056870912c00b000d344be7256mr847903oae.73.1645029439081; Wed, 16 Feb
 2022 08:37:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87ee57c8fu.fsf@turner.link> <acd2fd5e-d622-948c-82ef-629a8030c9d8@leemhuis.info>
 <87a6ftk9qy.fsf@dmarc-none.turner.link> <87zgnp96a4.fsf@turner.link>
 <fc2b7593-db8f-091c-67a0-ae5ffce71700@leemhuis.info> <CADnq5_Nr5-FR2zP1ViVsD_ZMiW=UHC1wO8_HEGm26K_EG2KDoA@mail.gmail.com>
 <87czkk1pmt.fsf@dmarc-none.turner.link> <BYAPR12MB46140BE09E37244AE129C01A975C9@BYAPR12MB4614.namprd12.prod.outlook.com>
 <87sftfqwlx.fsf@dmarc-none.turner.link> <BYAPR12MB4614E2CFEDDDEAABBAB986A0975E9@BYAPR12MB4614.namprd12.prod.outlook.com>
 <87ee4wprsx.fsf@turner.link> <4b3ed7f6-d2b6-443c-970e-d963066ebfe3@amd.com>
 <87pmo8r6ob.fsf@turner.link> <5a68afe4-1e9e-c683-e06d-30afc2156f14@leemhuis.info>
 <CADnq5_MCKTLOfWKWvi94Q9-d5CGdWBoWVxEYL3YXOpMiPnLOyg@mail.gmail.com> <87pmnnpmh5.fsf@dmarc-none.turner.link>
In-Reply-To: <87pmnnpmh5.fsf@dmarc-none.turner.link>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Feb 2022 11:37:07 -0500
Message-ID: <CADnq5_NG_dQCYwqHM0umjTMg5Uud6zC4=MiscH91Y9v7mW9bJA@mail.gmail.com>
Subject: Re: [REGRESSION] Too-low frequency limit for AMD GPU
 PCI-passed-through to Windows VM
To: "James D. Turner" <linuxkernel.foss@dmarc-none.turner.link>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, "Lazar, Lijo" <lijo.lazar@amd.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	Alex Williamson <alex.williamson@redhat.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 9:35 PM James D. Turner
<linuxkernel.foss@dmarc-none.turner.link> wrote:
>
> Hi Alex,
>
> > I guess just querying the ATIF method does something that negatively
> > influences the windows driver in the guest. Perhaps the platform
> > thinks the driver has been loaded since the method has been called so
> > it enables certain behaviors that require ATIF interaction that never
> > happen because the ACPI methods are not available in the guest.
>
> Do you mean the `amdgpu_atif_pci_probe_handle` function? If it would be
> helpful, I could try disabling that function and testing again.

Correct.

>
> > I don't really have a good workaround other than blacklisting the
> > driver since on bare metal the driver needs to use this interface for
> > platform interactions.
>
> I'm not familiar with ATIF, but should `amdgpu_atif_pci_probe_handle`
> really be called for PCI devices which are bound to vfio-pci? I'd expect
> amdgpu to ignore such devices.
>
> As I understand it, starting with
> f9b7f3703ff9 ("drm/amdgpu/acpi: make ATPX/ATCS structures global (v2)"),
> the `amdgpu_acpi_detect` function loops over all PCI devices in the
> `PCI_CLASS_DISPLAY_VGA` and `PCI_CLASS_DISPLAY_OTHER` classes to find
> the ATIF and ATCS handles. Maybe skipping over any PCI devices bound to
> vfio-pci would fix the issue? On a related note, shouldn't it also skip
> over any PCI devices with non-AMD vendor IDs?

The ACPI methods are global.  There's only one instance of each per
system and they are relevant to add GPUs on the platform.  That's why
they are a global resource in the driver.  They can be hung off of the
dGPU or APU ACPI namespace, depending on the platform which is why we
check all of the display devices.  Skipping them would prevent them
from being available if you later bound the amdgpu driver to the GPU
device(s) I think.

Alex

>
> Regards,
> James
