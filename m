Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FEF1F61C
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695823716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqU7xI+fwjYR7R9bTxX4DQNExmk2VQ9fRBeVw7xLj5c=;
	b=eHf6Xcr5BEpQwYlv6IxRRoS76mlsheWHr7QEBk6Q513PACsHs5SjsU4+IFq+ydJ8xU1oUL
	EZvx+awbAmnS02nIrylRvqcwczYCESNgSDgNVZ+TokAP2stJVaiTj3R931cy/2IEJogKFW
	cqe/HouKsLQXr6CnKpLvXHfM+rPl9v8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Sj3VvzQaPSqwak1mPtGxSw-1; Wed, 27 Sep 2023 10:08:34 -0400
X-MC-Unique: Sj3VvzQaPSqwak1mPtGxSw-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-277616d8a01so8763675a91.0
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 07:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695823713; x=1696428513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqU7xI+fwjYR7R9bTxX4DQNExmk2VQ9fRBeVw7xLj5c=;
        b=MHOvSvTKfIa45LiNGh/GUHvRNSueCa1m7RaKgKAQZL1Bx1Pp3XfEKb6G7ljRwgthQm
         ES7xWcGmtDTv63rxKs+AzwvE/bj+QqRdivKay+8+vCLN9LHlHqxG0c6na8JZoPYiKUSC
         q3vth1yIW156WgNsW/+bNKUXNz7zBLZx0ZbYPJ1YgSVGwXoqZUBe7nOrdfeeUIrmHK8m
         1qrpnqWj7iGnpf9LGADx9Vgz8DBa+jUgHk3zJAMOpTeXLN5TOsq721dQ0Sr1tJVv/mHn
         JwRQJUeQYxXWlQRjWt3IC/nAHogD9ujlC7d1W7ZrKnzT41ce+GeMe884FxwHLv/gE47s
         77Qg==
X-Gm-Message-State: AOJu0YzKlI2zdgijT7QUvsicBMKIEeVrFg16PN8IcHW/I+sYKX5cjTb/
	9PmvwB4M9B/rBaVtuJjJfcjX/LUBSpIxzUjvYSJfWy0nf/MaNVb4yL51KKB1JUrlfWLxQnc7CMh
	fEj08l+b2A9k1rYB5tUL4gvGDcUx4jCQvpXCsJkrSaxTyKZZg
X-Received: by 2002:a17:90b:4d11:b0:277:3afc:f27 with SMTP id mw17-20020a17090b4d1100b002773afc0f27mr9038745pjb.1.1695823712762;
        Wed, 27 Sep 2023 07:08:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfw5SUw/3UdkbV9cISB9GzmZq3XofG+jbzyDxnU4BxXbNz/4MgkWotyyEYQZGL6d8+tk9q38w2/FJ3n9HkyDs=
X-Received: by 2002:a17:90b:4d11:b0:277:3afc:f27 with SMTP id
 mw17-20020a17090b4d1100b002773afc0f27mr9038712pjb.1.1695823712427; Wed, 27
 Sep 2023 07:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230925141930.GA21033@wunner.de> <20230926175530.GA418550@bhelgaas>
 <20230927051602.GX3208943@black.fi.intel.com> <CA+cBOTds9k1Q2haC_gTpsUvjP02dHOv9vSconFEAu-Fsxwf36A@mail.gmail.com>
In-Reply-To: <CA+cBOTds9k1Q2haC_gTpsUvjP02dHOv9vSconFEAu-Fsxwf36A@mail.gmail.com>
From: Kamil Paral <kparal@redhat.com>
Date: Wed, 27 Sep 2023 16:08:05 +0200
Message-ID: <CA+cBOTcd=SwQQQXvLpf+cgwC=mkUu_wy5=6ZUtqJiiVtL+N08g@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev, bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending my previous mail again, because I haven't sent it as
text/plain and it was rejected by the kernel mailing list. See below.

On Wed, Sep 27, 2023 at 3:43=E2=80=AFPM Kamil Paral <kparal@redhat.com> wro=
te:
>
> On Wed, Sep 27, 2023 at 7:16=E2=80=AFAM Mika Westerberg <mika.westerberg@=
linux.intel.com> wrote:
>>
>> I would also try to change all the BIOS settings back to defaults, see
>> that it works (it is probably in "user" security level then), then
>> switch back to "secure" (only change this one option) and try if it now
>> works. It could be that some setting just did not get commited properly.
>
>
> Hello, I have some interesting findings.
>
> I reset the BIOS ("load BIOS defaults"), however that doesn't reset the T=
B security level option - whatever is set is kept. So I can't really find o=
ut what the default value is and whether I changed it. However, to my surpr=
ise, the resume was suddenly fast even with the Secure Connect security lev=
el. So I went through options one by one and finally discovered that the "W=
ake by Thunderbolt 3" option makes the difference. It has the following des=
cription:
> "Enable/Disable Wake Feature with Thunderbolt 3 ports. If Enabled, the ba=
ttery life during low power state may become shorter."
>
> It is enabled by default, I had it disabled before. When I enable it, I h=
ave a 5 sec resume even with Secure Connect TB security level. The dmesg fo=
r such a resume is here:
> https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1990815
>
> I'm sorry I haven't spotted and tested such an obviously named option ear=
lier. My understanding was that this option either wakes up my laptop when =
I connect the cable (tested now, it doesn't appear to do so), or that it wa=
kes it up when I move/click my dock-connected mouse (tested, doesn't appear=
 to do so). So originally I wanted this disabled (and I had no kernel issue=
s with it disabled, prior to e8b908146d44), but it seems I misunderstood wh=
at it does. And I'm still unsure what exactly it's supposed to do and why i=
t should kill my battery life in the process, according to its description.
>
> Hopefully this helps to bring more light into this?
>
> However, I also discovered that even though Wake by TB3 + Secure Connect =
gives me a fast resume in a normal case, I still see a 60+ sec resume delay=
 when I disconnect and then reconnect the TB cable while the laptop is susp=
ended (which is a frequent use case for me). That doesn't happen with the U=
ser Authorization level (regardless of Wake by TB value). So I'm staying wi=
th User Authorization for the moment.
>
> Cheers,
> Kamil P=C3=A1ral

