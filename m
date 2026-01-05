Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB2D20A5E5
	for <regressions@lists.linux.dev>; Mon,  5 Jan 2026 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636858; cv=none; b=UwCP9dIHZRj1b01p4HINDZM0Fu/8L4NP9gCEhTXajfYHJI0XYxyxz9qfBd/MjT1bHm0BQcnSmQOsxOKG83dXrJFOq5Xj9SwhNICKHEgObEa+zhkmR6gSNX09ZSnjjkJGA3D/rs7AGlgL1ViUGCNgnxdVbGPDq7GzyO8yM3yoHNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636858; c=relaxed/simple;
	bh=bqtNUILbm6lJat/9Xu0gpKiAI1RZvgXVDpApnTxDQMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phRiL+z5ujClaAAar/q1/oKkx0OzfRoJ8jqMNneFp7bgZHP7lFJATximpuKtLcUGLNPx5gxJNfraQU4jB5mJsEJv53YaNDcwSH2BN7GD8ExAbKcJRHBbX+3o03Dur6UOi2IVekF6mBZ0sXN38Hk+V2CSHvHfU5GgOMWWQu3FZgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2A1rkq0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2A1rkq0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43246af170aso146090f8f.0
        for <regressions@lists.linux.dev>; Mon, 05 Jan 2026 10:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767636855; x=1768241655; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/oP9O+J1jrunuk+Y661pj013SgRFAFyNbhxBfEwCmlA=;
        b=e2A1rkq0AYTMwCUBelCYleuRb7S5MbO0mEV1ZqGdm4ccpmaxtopTwjAw8t3QFtJldn
         EbtaoQyQg+J1+k4HlO9VFC7vZJxIHBgqjA8d2+B/WXU2bfyP7H8i0FEbrf3LMNJ6Z/V/
         IP7smc52nnNOfm1UEPbTg/sS/umarUXtVgJvpGkc6sUyCEEf+4iUfJHL3QJosP71rfzr
         tRImBoA9XpFrSnmY6ovL+9Ur9mO6HhTc+aXOfPD1wZ0lw2WDZXSmOQpcKd+th0URLDFl
         tFWYkJGdbBUe4EvUudnbFtOTIlxLlbDHE6Nh7rFRfwRLJ8b7oEuQiMnKvMr/i/KwWqI/
         TeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767636855; x=1768241655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oP9O+J1jrunuk+Y661pj013SgRFAFyNbhxBfEwCmlA=;
        b=iAY1iIfUUUWsP06WFT3XoeKjLblmPMsZ/a61Gwp7GeK6pGMLVZY3ppXEMdPtsQdJrw
         CTcI8oXuVCsV8qmy1RTzvm2pnp0Isaau7ES5DKiHUgt99gTqRE/i+34z1x0blJdatCq9
         4QbiaJJV8xs0SjRVpQs/H6e5ToPlUsqU29VgkuqDRH7PIwBGGrjPtIIrUw/7HS/8xW3Q
         sWM07RFFXU8VxGktKtCYwBKNa0k1V2j5d60on6MPGS5jTJY9svbbxOaSBkCr2KLB8JuV
         YkCiOBD9lmjQXsE1Vfo1wDXv1bq+HMCISI3zMlezSzcdt+64qhZ+MCVG3ShTNjMkqJwo
         5SEw==
X-Forwarded-Encrypted: i=1; AJvYcCXp9+hBXy8qj8jOpvj3cjKbp2nvoOtB9a5CiTgflTVl56NL+vxXlVlyjPs5WNTheZ85Ia+CxJh/0/XtNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwACazOLxXyE/WPaw2fpbPPKeZw2JQvMn6W4YHaAr1k8deS3ac8
	G5P3ZndGrLc/WU+Dm3vZgHm5FPV1q2O4tNMzT/Q8yIyH/cxOEfC7jdN8
X-Gm-Gg: AY/fxX7keD8RM2BKOutIZZaOhyWCQBmTm4MDEiT0IhDJ9beETu6NZF2OAsjPsuHOoZ7
	GhslgziBUWsq6vnPKTeg6AW0oB/Kb/DwKYLINv3zLNSQJcuUYbZIjr30839Uot3ih3gVakJs44i
	6ePQTjy9Srs+4wATCEihYuhA8+tVB49QtBPxjoqx5DhZAclbhvNMSrTpvZcYmZ0Ts287x9az2ul
	bjyPXmALNw2yS6WSROS2dNgdqnucM7duHnWh6cOgBMNuJ5A83KpaIqtwJ217l1IFwFv8zKg1vdG
	lffp9bM1MOhe1ABGDbPx3tKTdW2jowUBFPoRFqLRu6HMQXsNo3a33thHqDSNNjc91VXe2VFy0Ee
	s+LL+OaWdlm48TmCeII46GQcri/9UEkJO8PLtwIwk/7FSuqNOOH7I5YrxtVVmnmGdPy59RLfXhp
	O+3pZbbEffUTIMGfG4dkSQYNLwo1/s6l/BkEsqAlHSe8j56RKEkgWE8dI=
X-Google-Smtp-Source: AGHT+IE/WbbnXt6m79lszz8chS7NFY/jLDyt4rB9ShhndFA1aa1Z8u6f+/lIFkSh4Lfi6OF6YByoxQ==
X-Received: by 2002:a05:6000:26ce:b0:430:f3bd:71f8 with SMTP id ffacd0b85a97d-432bcfde915mr70237f8f.25.1767636855046;
        Mon, 05 Jan 2026 10:14:15 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bca5a132sm688291f8f.39.2026.01.05.10.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 10:14:14 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 44C5FBE2EE7; Mon, 05 Jan 2026 19:14:13 +0100 (CET)
Date: Mon, 5 Jan 2026 19:14:13 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ben Hutchings <benh@debian.org>,
	Roland Schwarzkopf <rschwarzkopf@mathematik.uni-marburg.de>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>, debian-kernel@lists.debian.org,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	regressions@lists.linux.dev, 1124549@bugs.debian.org
Subject: Re: [regression 5.10.y] Libvirt can no longer delete macvtap devices
 after backport of a6cec0bcd342 ("net: rtnetlink: add bulk delete support
 flag") to 5.10.y series (Debian 11)
Message-ID: <aVv_dewfbbgQ5o0J@eldamar.lan>
Mail-Followup-To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Ben Hutchings <benh@debian.org>,
	Roland Schwarzkopf <rschwarzkopf@mathematik.uni-marburg.de>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>, debian-kernel@lists.debian.org,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	regressions@lists.linux.dev, 1124549@bugs.debian.org
References: <0b06eb09-b1a9-41f9-8655-67397be72b22@mathematik.uni-marburg.de>
 <aUMEVm1vb7bdhlcK@eldamar.lan>
 <e8bcfe99-5522-4430-9826-ed013f529403@mathematik.uni-marburg.de>
 <176608738558.457059.16166844651150713799@eldamar.lan>
 <d4b4a22e-c0cb-4e1f-8125-11e7a4f44562@leemhuis.info>
 <27c249d80c346a258cfbf32f1d131ad4fe64e77c.camel@debian.org>
 <6498cffd-5bf9-490a-910d-f64ab9b7f330@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6498cffd-5bf9-490a-910d-f64ab9b7f330@leemhuis.info>

Hi,

On Mon, Jan 05, 2026 at 01:30:59PM +0100, Thorsten Leemhuis wrote:
> @stable team and/or @net maintainers: this imho needs a judgement call
> from your side. See below for details.
> 
> On 1/2/26 21:18, Ben Hutchings wrote:
> > On Fri, 2025-12-19 at 10:19 +0100, Thorsten Leemhuis wrote:
> >> On 12/18/25 20:50, Salvatore Bonaccorso wrote:
> >>>
> >>> Is there soemthing missing?
> >>>
> >>> Roland I think it would be helpful if you can test as well more recent
> >>> stable series versions to confirm if the issue is present there as
> >>> well or not, which might indicate a 5.10.y specific backporting
> >>> problem.
> >>
> >> FWIW, it (as usual) would be very important to know if this happens with
> >> mainline as well, as that determines if it's a general problem or a
> >> backporting problem
> > [...]
> > 
> > The bug is this:
> > 
> > - libvirtd wrongly used to use NLM_F_CREATE (0x400) and NLM_F_EXCL
> >   (0x200) flags on an RTM_DELLINK operation.  These flags are only
> >   semantically valid for NEW-type operations.
> > 
> > - rtnetlink is rather lax about checking the flags on operations, so
> >   these unsupported flags had no effect.
> > 
> > - rtnetlink can now support NLM_F_BULK (0x200) on some DEL-type
> >   operations.  If the flag is used but is not valid for the specific
> >   operation then the operation now fails with EOPNOTSUPP.  Since
> >   NLM_F_EXCL == NLM_F_BULK and RTM_DELLINK does not support bulk
> >   operations, libvirtd now hits this error case.
> > 
> > I have not tested with mainline, but in principle the same issue should
> > occur with any other kernel version that has commit a6cec0bcd342 "net:
> > rtnetlink: add bulk delete support flag"
> 
> FWIW, merged for v5.19-rc1 and backported to v5.10.246 as 1550f3673972c5
> End of October 2025 in parallel with 5b22f62724a0a0 ("net: rtnetlink:
> fix module reference count leak issue in rtnetlink_rcv_msg") [v6.0-rc2],
> which is a fix for the former.
> 
> > together with an older version of libvirt.
> > 
> > This was fixed in libvirt commit 1334002340b, which appears to have gone
> > into version 7.1.0,
> 
> Could not find that commit when looking briefly, but that version was
> released 2021-03-01.

For reference it is this one I think:
https://gitlab.com/libvirt/libvirt/-/commit/81334002340be6bd3a1a34c6584a85fe25cc049c

Regards,
Salvatore
