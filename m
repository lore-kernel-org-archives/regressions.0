Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07E0362
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 17:37:32 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id z190so11411178vka.4
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 09:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snuAeqrKkcnHwzA0AdwomJTJESrNdqyAgQMbGE4/gOc=;
        b=7NqV5jfakndFS5gJCSLNkhdDe/7VnLVtsZ0f8MHQDP0PxJsBbIVszoAk8pdyEJbZMW
         6e7F+hJp5bjg1Ce0KWstIhGCceK65s8pov6KrLsjmo6bTnj+oLE3IFoUFfuuEN3V+BDi
         QxSvRJQG2MNN5XQG2eUFCxSdAKpOnS81djC/xxHS3GhRicQj4gYugC4Iboj5+Z5DTChH
         InqNPY5mTQVfT5dtMHYI7LFeyKTinZGdDaBaGaBr3Au3bTT4sA7cO+Wm+TZGLWwYpwuQ
         9AzLbGueFdCc0vtCGwTzJDeXRPItgK8oo1sOP2ANIgzZ4onhfijZAdQ03WKGpK8Xae+y
         +XsA==
X-Gm-Message-State: AFqh2krg28jgmgLrF79tg+vjmUh0Lke1BGBcgASvzuiEnkT2PuPAq7S0
	kGbuON1Z8/Aj5uSQTER349/rpYSqH1EiYQ==
X-Google-Smtp-Source: AMrXdXvW0xIsSx1N720roXkOWz+ghPcrnfNXV7KAcmlPcNxlj8KQRUYTiza5nK0VC8AxGU0Gn/rFhA==
X-Received: by 2002:a1f:abd2:0:b0:3d5:b3df:4ef9 with SMTP id u201-20020a1fabd2000000b003d5b3df4ef9mr4185655vke.9.1672767451306;
        Tue, 03 Jan 2023 09:37:31 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id u5-20020a05620a0c4500b006cfc1d827cbsm22406189qki.9.2023.01.03.09.37.30
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 09:37:30 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-46d4840b51fso386536527b3.12
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 09:37:30 -0800 (PST)
X-Received: by 2002:a81:ae0e:0:b0:388:941:23a8 with SMTP id
 m14-20020a81ae0e000000b00388094123a8mr5281814ywh.152.1672767450539; Tue, 03
 Jan 2023 09:37:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <14722778-dda0-cb9f-8647-892493d94a5c@leemhuis.info> <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
In-Reply-To: <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
From: Dave Chiluk <chiluk@ubuntu.com>
Date: Tue, 3 Jan 2023 11:37:19 -0600
X-Gmail-Original-Message-ID: <CAMfi-DTwX2nvP58FRb6NaGMyWO0SBo9W=Fpdtr=XfNRzkqAwHw@mail.gmail.com>
Message-ID: <CAMfi-DTwX2nvP58FRb6NaGMyWO0SBo9W=Fpdtr=XfNRzkqAwHw@mail.gmail.com>
Subject: Re: [regression] Bug 216753 - 6e 6 ghz bands are disabled since 5.16
 on intel ax211
To: "Coelho, Luciano" <luciano.coelho@intel.com>
Cc: "regressions@leemhuis.info" <regressions@leemhuis.info>, 
	"Greenman, Gregory" <gregory.greenman@intel.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2022 at 5:33 AM Coelho, Luciano <luciano.coelho@intel.com> w=
rote:
>
> On Thu, 2022-12-01 at 11:14 +0100, Thorsten Leemhuis wrote:
> > Hi, this is your Linux kernel regression tracker.
> >
> > Luca, I noticed a regression report in bugzilla where I'd like your
> > advice on. To quote https://bugzilla.kernel.org/show_bug.cgi?id=3D21675=
3
>
> Hi Thorsten wearing-the-regression-hat, =F0=9F=99=82
>
> I'm not the maintainer of iwlwifi anymore, so I'm adding the new
> maintainer here, Gregory Greenman.
>
> Gregory, can you take a look?
>

@Gregory Greenman as I'm sure this got buried over the holidays, can
you take a look at this and advise?  This is definitely a regression,
but I don't think a lot of people are noticing it or don't yet have
6ghz access points.  I can write up a patch removing the offending
commit (698b166ed), or I can add an iwlwifi option to ignore the 6e
ACPI bit.  Which would you prefer?

Dell has been of little help which I pretty much expected.

@Luciano, as you were the author of the original change, and I'm not
familiar enough with ACPI, is the below code reading the enable bits
from the BIOS ACPI table or is this somehow coming out of the network
card through some UEFI extensions?  I'm trying to figure out which of
Dell or Intel need to update their firmware?  I think some Lenovo's
have similar problems, so I suspect it's a BIOS ACPI table problem.

 ret =3D iwl_acpi_get_dsm_u32(mvm->fwrt.dev, 0,
                                   DSM_FUNC_ENABLE_6E,
                                   &iwl_guid, &value);

Thanks,
Dave.
