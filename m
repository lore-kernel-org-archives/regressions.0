Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929091D9A48
	for <regressions@lists.linux.dev>; Fri,  6 Dec 2024 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475910; cv=none; b=ryrbjxPEZT3Vb3qfJlquaKv0fksKgVaPj3+e5ruqigoUbtanoZXhNusn5RXl05FC7QNd4RJELcZFX4vtnmnHQEaofSEMI6qtrqSR0D6OQKYIQRyySENiS3/AbNaCr1khgFcm+Vezf97nh9X+lfC1BaRdkX5JBXXp/USVDIb3G9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475910; c=relaxed/simple;
	bh=Yr0g3WmQW+IHXu+PjpY2ZQ2+PDu7yU9MPGfZM+h7qLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0COkSGbsQ6bdVQ1QdzTnEIA/JrzSzWTK0RL8EauV+FMoik6bMQYw9yWAIhXbd/5VIR94+055sGFvifxXLfPeem+1wtyn7Up0zaQxZ46WZ+nPuCFxcKsICbVHcqIHl+w3LwxqPscy5ZrlX1VeEIy6oYmZUCE5Kxp+fAinBcrG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDkOYbnL; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDkOYbnL"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30037784fceso1736611fa.2
        for <regressions@lists.linux.dev>; Fri, 06 Dec 2024 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733475907; x=1734080707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efsIOzc9I0KV4PldJMZIG9pg8gFQONLYL0eK0acbihU=;
        b=gDkOYbnLycl2O3Gerl50fL2gIQad3riRvhUQ8+YbPBa2xIpHk/IselDs1K02fgYyDh
         dcMjqfgl9o1ERHsA5ZP4f1yqjdskIKz07/WZ7F1tMuzkkRT2MS0SufvTB+G0QY8eslmR
         SKFXosfEDO8QmL9w3FL4OknoTcp9DkH6ZQBmAvec4+dP+RST3QE30tKWqgJq3+F8S1Mr
         FyIJsi5N93h89LaIpcrb3wmFzSXwTt0bwNrJ5e4sTtlqTpzW3JGU4MsXV0mRs+08iJ8t
         w6BmjBVQ+kMXTkGQiaFxaw8YRVCU2I0MUWEIOTQZvnBDWnIjVV+TgBZNAA/2nLLcsjal
         2qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475907; x=1734080707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efsIOzc9I0KV4PldJMZIG9pg8gFQONLYL0eK0acbihU=;
        b=dxQFt919rMi+dajiqtKyDtbcPRrG1SHNxoBHnytcEAx1Bp+1iJkdtlEJy8NHeXn0i6
         m1J66Piqjt/o/EtJAAcysf/X7EN4Z/QCIFeIUaXN1+7MZyUO5GxzVFllIKdSLpnDfgjk
         hDQDd6aHtbl4crG7wqZpawe2FyU+yZkVMPd6Ho4f/inhoTOorFDcgPz3JubuYHy74G6h
         Ygczt2FQdvPXZowTnJ8CsVMbzJNxaUMV33cE1yEZS/UUoLXmiELoeUzvvbQFQKIQr/UE
         WIZuKGFMQyjTOae47KjIN9PlAJMXh9d5bduUsStxFwYK8CySK6PVLfhSsSE+C6f7LxJK
         YLew==
X-Forwarded-Encrypted: i=1; AJvYcCV8R37lo+Qpv/kqDOc9Gg0DVPQDPX8DrjmgoIgZKzrJvbH0zw41SjPg43J2vyR+EkeVlvd8m11RHLy+Rw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQHzYHn18Pps9nrBxXHm2BboxHZqIhTL/fm5nWnDyFjRiC9iM7
	6QxF9CcxyWXnfDusYcLFTd+eJJbfATbu3blDY/VpYgJoOyvJsyx2CXVeKBYAqj1fT1KgE8nUPDN
	eKhZra05wlT0vDgS/bgET5ztm7ow=
X-Gm-Gg: ASbGnctQ5Abd6p3D9aa74lqIBxvWasc7z6ygglh+8fxgVp/IiA17NhiM/ss6OTVuySq
	B80FyQNX0lrPd600VGTIlmzRbrRJucdA=
X-Google-Smtp-Source: AGHT+IG3PcR91L2T9z3OmlJIfEmknI/xIPqLFBSaFNeahHyyl0XqsdvHAwMamczMXZSxQGrufLIUoq1zoKwW+VQQ06I=
X-Received: by 2002:a05:651c:901:b0:2fb:4b0d:9092 with SMTP id
 38308e7fff4ca-3002f89e98dmr9183041fa.1.1733475906447; Fri, 06 Dec 2024
 01:05:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241104141924.18816-1-kabel@kernel.org> <20241104141924.18816-13-kabel@kernel.org>
 <87bjyv9ecb.fsf@BLaptop.bootlin.com> <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si> <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
In-Reply-To: <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
From: Klaus Kudielka <klaus.kudielka@gmail.com>
Date: Fri, 6 Dec 2024 10:04:49 +0100
Message-ID: <CAPy0QmsF1qr3A-89BDQHu-QVXpMhMGWt8e74FfDkqVT6Ha7q-g@mail.gmail.com>
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, 
	regressions@lists.linux.dev, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 1:43=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
> On Thu, Dec 05, 2024 at 01:38:10PM +0100, Marek Beh=C3=BAn wrote:
> >
> > This is because the patch went into 6.13 but the rest of the patches
> > did not, Lee wants to take them for 6.14 :-(
> >
> > Apply this series and it will work.
> >
> > https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.o=
rg/T/
>
> Alternatively you can overcome this issue if you enable the
> turris-omnia-mcu driver in 6.13:
>
>   CONFIG_CZNIC_PLATFORMS=3Dy
>   CONFIG_TURRIS_OMNIA_MCU=3Dy/m
> (and also the subsequent options).
>
> Marek

Thanks, I will try that when I'm back at the hardware (in a week or so).

Do I correctly understand the situation:
For the Turris Omnia LEDs there is now a temporary dependency on
CONFIG_TURRIS_OMNIA_MCU, which will vanish in 6.14?

Best regards, Klaus
