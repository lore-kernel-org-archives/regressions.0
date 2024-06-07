Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C001156C6C
	for <regressions@lists.linux.dev>; Fri,  7 Jun 2024 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717746957; cv=none; b=lrOS2oZcBT7AsnmUAlyTJA09Ey0PzQWGs4FyUIIJQYzKwKLP1Do/FCLWNUpxBL61NMumGOF4ojQroWfYPzTAIssgwK3FqU02lvRgCQHJSBVVutmW4LOFBgBF2L5uy8SSmv2NYZ1RQgCccfayl3nY/ykjEZkDic+VvgET2auBnhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717746957; c=relaxed/simple;
	bh=uI/QJseRNnSAiLO/gbeFRBPFZN8DhNI0NiQg672psP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcSxi4yqmCCW1WT7aHCsJrdj0nawY1NwNGETdzie621t9DmUQzEaEkAUhYYwwbPbRZtLwkxMuLnvB9m1rAMaGgE0UffdV5kHkOqbizpFi+Zp5qcRcLj+ligZKTY07JsxDKD6B2gATJMWsZ8OmSSHTbC4KSUcQ1bcG48XB96ijn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uncxKJp9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uncxKJp9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C869BC32786
	for <regressions@lists.linux.dev>; Fri,  7 Jun 2024 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717746956;
	bh=uI/QJseRNnSAiLO/gbeFRBPFZN8DhNI0NiQg672psP0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uncxKJp9Rd6wTGoqDlc/MCcyU8XrR9RGllBMkd0LJsAhFV/T6kUq/3nWX55U6gm8F
	 nORczrlFqrWBg/P9lhbiQiu+OJQeKg/gB1cWtIaAAL/rhhyYiQhmfmxSMOBIluREl5
	 prAXdz/yG9ZgHt8hmQKALl0mZsRaizaqo6z4VokIJ7xbMdLUFuMRWgB3XdUXxQsGuy
	 AnyAul5lIV/QICjfB0pjwB/31gEtHf4LuFxgnZADXI+tzt3SxZSDqEr2qeIbQdfm7k
	 /jdqXS9Sn03ashKjdTLpBjV8cJ7r/tjlYeH4lzSH2TGF0BsLu9Y8faCLC0014X7mdK
	 jv1vAJJZcKHoQ==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b3364995b4so270798eaf.0
        for <regressions@lists.linux.dev>; Fri, 07 Jun 2024 00:55:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXd8CCb0dRmWI9Qnt6IioLDJYIIhmGEBfsYFSanVIf1vJAJAVD4UImzJ9DAMLr0mngNgPeQQXlpI+nWAzXxObDA4ERx2oEELIqvaC4=
X-Gm-Message-State: AOJu0YysTnTT/KxQQjsnt0qQbkPcK7ALKI8rm90GMlrfz75vSYzYSAq1
	9qMNVNegeUOM+EVVUBvx7p4YCUmGooPvZWhKdd4KMabAavva5KDhthOr67w6p4qOUYrecEpN5r+
	bFOkBJUUGbcpAW6VF4cmgYAGPL6g=
X-Google-Smtp-Source: AGHT+IEvrjNzx6O5y/0sU9VeobXh56cdEvsv6pP4P2j7KZIrqGPsUL26GPjlnKSeIbjU+Z3fWr4/U5NUyIxtbRJC+gs=
X-Received: by 2002:a05:6870:58c:b0:24f:ddd5:a21d with SMTP id
 586e51a60fabf-254649a6f97mr1862748fac.5.1717746956049; Fri, 07 Jun 2024
 00:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
 <20240528084413.2624435-1-sakari.ailus@linux.intel.com> <a05df025-a0be-49cd-84a9-7d7fb2eeb33e@redhat.com>
 <e9062095-b312-44df-a9e3-0b09f3ec9eff@redhat.com>
In-Reply-To: <e9062095-b312-44df-a9e3-0b09f3ec9eff@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 7 Jun 2024 09:55:44 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0i1NxGHMKskP7W+hAusjt=5jYYWTF2vgJPR0gnrNTgFaw@mail.gmail.com>
Message-ID: <CAJZ5v0i1NxGHMKskP7W+hAusjt=5jYYWTF2vgJPR0gnrNTgFaw@mail.gmail.com>
Subject: Re: [PATCH 1/1] ACPI: scan: Ignore Dell XPS 9320 camera graph port nodes
To: Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Genes Lists <lists@sapience.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, wentong.wu@intel.com, 
	linux-media@vger.kernel.org, linux-acpi@vger.kernel.org, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 8:12=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi,
>
> +To: Rafael since this was Cc-ed to linux-acpi but never send
> to Rafael directly.
>
> Rafael this fixes a crash in 6.10-rc1 for some users and is necessary
> to make the cameras work on the Dell XPS 13 plus 9320 .
>
> On 5/28/24 7:09 PM, Hans de Goede wrote:
> > Hi Sakari,
> >
> > On 5/28/24 10:44 AM, Sakari Ailus wrote:
> >> Ignore camera related graph port nodes on Dell XPS 9320. They data in =
BIOS
> >> is buggy, just like it is for Dell XPS 9315. The corresponding softwar=
e
> >> nodes are created by the ipu-bridge.
> >>
> >> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> ---
> >> Hi,
> >>
> >> Could you test this and see whether it fixes the warning?
> >>
> >> The camera might work with this change, too.
> >
> > Thank you I just received a Dell XPS 13 plus 9320 myself to use
> > for VSC testing and I can confirm that with this patch 6.10.0-rc1
> > works, including giving a picture with the libcamera software ISP +
> > 3 small libcamera patches.
>
> I forgot to add:
>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Applied as 6.10-rc material.

I've also added Reported-by and Closes tags to this, but I'm not sure
which commit exactly is fixed by it, so the Fixes tag is missing.
