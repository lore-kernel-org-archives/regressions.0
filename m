Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85871C37AB
	for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723832972; cv=none; b=IfapdQB2qyw/fIENcqLBklOCN+xSUZveZNG86SKssMsoRaYNCX9IiQYJVkIHVHSB9AbWniC8U9U24umS4hWB0lrSGsRHOLT0YkFNKZjUMtZFldzQTsoKAvo9rvxcwl5xsxhecqNsqqz3/BJaKCdkTjNY0IyMMZI8TdkTVEfc4nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723832972; c=relaxed/simple;
	bh=MEnY5dW4BizxQHSga1Zlxnjl7jRyw2lRpBPUuQnt3L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBtKPs+O1WbN5Ihp5ioABxo/MWArqviXwgVHcag9QCrt6W1ougOzGVW9q69Kgq+325vmfypcaZbZPT9ViSmZwKenQvjigNb/+gvWUHl7BUKuRO3mxrPuXIjl0CLrQogT5CqLrLozsh+w2UBQqB1Wub05AVJxH1nkyrSWck+q5sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uS7y/KyZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uS7y/KyZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D65C4AF0B
	for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723832971;
	bh=MEnY5dW4BizxQHSga1Zlxnjl7jRyw2lRpBPUuQnt3L8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uS7y/KyZXlRijF3o9ceCHJPXPE11rMuJwUEaJLAFd7YjEf7vCckXUK9zoQ44eFrDJ
	 zO0ucI14dhHGShenGp0Vhe27e0714oplQfhVgaY/yItZEMKvSTEWTFuyPSGTQwA6TP
	 ES7kWZ02qRk9yK2nX/ws+iau4WpOgMVIHqj5OdQy7Azfx6m07pCjLfnCAxCKt7sZH+
	 vi+6h1mX1fJCRCdST0JdWLOWnTyyjg4aErIJFqDnkZopWyVwRc/PC4ao/f5J9ya9YP
	 H815+Y9bQKw36couhgiGgrKCt2SBZyr34xWhnqeWfTBzaN4t7rA4SG5gM8SEp50Rt9
	 FyScAN1GxhF2A==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5d5cba31939so247149eaf.0
        for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 11:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUdK1l0OiY9I6rC4fT0Yo1gkPULJfmz4e3I5jEQCmQmZti0UdwVlFxUjdS8TQKwg+2TymaNHNFiT+RH+746+WjZQpWykloUigOqvs=
X-Gm-Message-State: AOJu0Yx93q2uBwjPSO9KNeie9hn6xIEwATVqzVPho/pejXcrFMT/DuqP
	lQ9/xcR77e2Cj9spYdUbCCjIBKvk148/3i8Dh7SO3k6aoImgq9q6tPG92WosMDF416T+Rzna1Zl
	daAiiLV89K9m5BrjbsDOpq4kxYs4=
X-Google-Smtp-Source: AGHT+IEQDtDifU/ay61Nag/OTb/NwAraSufQacFl3Jwy2M6bzQypfkwBuAVU6h0dCTMxUWcXykK68NNUvQD7CXN0GAY=
X-Received: by 2002:a05:6870:b4a4:b0:268:2075:a41d with SMTP id
 586e51a60fabf-2701c5235a6mr2356726fac.6.1723832970816; Fri, 16 Aug 2024
 11:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <60ac8988-ace4-4cf0-8c44-028ca741c0a1@kernel.org> <bd149809-f670-4b5d-a18a-f1f63624265f@kernel.org>
In-Reply-To: <bd149809-f670-4b5d-a18a-f1f63624265f@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 16 Aug 2024 20:29:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jrgC+cvjDfw+vQ1jyVz1oj28uTf9k+-Kk2EAPJj3VmdQ@mail.gmail.com>
Message-ID: <CAJZ5v0jrgC+cvjDfw+vQ1jyVz1oj28uTf9k+-Kk2EAPJj3VmdQ@mail.gmail.com>
Subject: Re: ACPI IRQ storm with 6.10
To: Jiri Slaby <jirislaby@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	Linux kernel mailing list <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 8:48=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 14. 08. 24, 7:22, Jiri Slaby wrote:
> > Hi,
> >
> > one openSUSE's user reported that with 6.10, he sees one CPU under an
> > IRQ storm from ACPI (sci_interrupt):
> >     9:   20220768          ...  IR-IO-APIC    9-fasteoi   acpi
> >
> > At:
> > https://bugzilla.suse.com/show_bug.cgi?id=3D1229085
> >
> > 6.9 was OK.
> >
> > With acpi.debug_level=3D0x08000000 acpi.debug_layer=3D0xffffffff, there=
 is a
> > repeated load of:
> >> evgpe-0673 ev_detect_gpe         : Read registers for GPE 6D:
> >> Status=3D20, Enable=3D00, RunEnable=3D4A, WakeEnable=3D00
>
> 0x6d seems to count excessively (10 snapshots every 1 second):
> > /sys/firmware/acpi/interrupts/gpe6D:   82066  EN STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:   86536  EN STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:   90990     STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:   95468  EN STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:  100282  EN STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:  105187     STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:  110014     STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:  114852     STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:  119682     STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:  124194     STS enabled      unmas=
ked
> > /sys/firmware/acpi/interrupts/gpe6D:  128641  EN STS enabled      unmas=
ked
>
> acpidump:
> https://bugzilla.suse.com/attachment.cgi?id=3D876677
>
> DSDT:
> https://bugzilla.suse.com/attachment.cgi?id=3D876678
>
> > Any ideas?

GPE 6D is listed in _PRW for some devices, so maybe one of them
continues to trigger wakeup events?

You can ask the reporter to mask that GPE via "echo mask >
/sys/firmware/acpi/interrupts/gpe6D" and see if the storm goes away
then.

The only ACPI core issue introduced between 6.9 and 6.10 I'm aware of
is the one addressed by this series

https://lore.kernel.org/linux-acpi/22385894.EfDdHjke4D@rjwysocki.net/

but this is about the EC and the problem here doesn't appear to be
EC-related.  It may be worth trying anyway, though.
