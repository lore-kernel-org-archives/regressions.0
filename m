Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF98317C221
	for <regressions@lists.linux.dev>; Tue, 11 Jun 2024 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718109555; cv=none; b=NF15WjQCPhucLBshJg1knbdcysA3uAdkaDTJsC2VZI+oL94PkVhavJ4aNyAlR1FTnbVb7zPibA49k9Gzol1gHh1q4nkyn7U8UFRp62EkgKI7Pt9vpUNhUijG4qTG+YZt7NefxMmt0nNfW1xabtQAcOKs5zI/f+iaxAUrOcP2BdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718109555; c=relaxed/simple;
	bh=bW6N6pj+DmUeZYsB0tv4MaS4r2DUYTYQ4hrlW1hr+uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YvGz3PnjkZowbze/hiRFafg1m135nfEWGan3QhmRFu0APFBlizoePyFo8COl/R9LXIYwCeEtbiA27Llsv0M69OhOWwGYuvDPtzDCFmDD6TmjApmq3/968+wUMBfiyA4r12RUISUVgQrN/OwMeBIg+8LFlC4yfqGE9N3yf23gnvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+6MxKfK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+6MxKfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF2CC32789
	for <regressions@lists.linux.dev>; Tue, 11 Jun 2024 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718109554;
	bh=bW6N6pj+DmUeZYsB0tv4MaS4r2DUYTYQ4hrlW1hr+uM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r+6MxKfKyNWX3xxuRi9FmnSfI1nAnVK4zhMqUwxAuGQOEBYZQtginPo3VKo8DfhDl
	 SeFLrnyNNA0U6b7KW+DR62zKPiNDtv9txGDvC4gxszldGbIuDR8NwYtZyWPkjmU5Mj
	 LRCSN9N2SPC84tCJOvNW8K2e46Mx9akbgmGnrjLhpB9ns4ds6R7ZOb3On6vw79QhbG
	 xf2f6WWw8fD1bMljgZg1yeu0JuVz50PwlZHJzTSjsCEWl1wgwIeldKXbsLKGK7uvgl
	 o1T0rx0EGUt3odyv/lNeO3N3D6AU99Li9Cu0JnnUNdv8XBLBD6YK8T9TXKpwV42mtV
	 2oKwZ8QDY/SUA==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5bb10cfe7daso147650eaf.2
        for <regressions@lists.linux.dev>; Tue, 11 Jun 2024 05:39:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YyNaAGJAs5316N2xY7kwZrTiyDH901QrDXZKiqlf7dxeoc9HtAO
	NV7lwtrTSEnFfAutg982KXj6Q8VmRoQs1jFmEmTZS6AaQN5c6ulvL3kiVemEuOupKkRJEm3zbYN
	Z9vED3JAFTo8Q8IAWhfbQs4F3LjM=
X-Google-Smtp-Source: AGHT+IHjW1iEa9gr1jDZ52bQX+S72S3JPpspolo5XoM0RZeO2qfkBp4AnIYKZPBY6dS6CCOvrEXxw5/yw2lzlWYBtT8=
X-Received: by 2002:a4a:d483:0:b0:5ba:ef94:7dc3 with SMTP id
 006d021491bc7-5baef94829bmr7179416eaf.1.1718109553466; Tue, 11 Jun 2024
 05:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <af575951-d884-4148-977f-a3450ceaee82@leemhuis.info>
In-Reply-To: <af575951-d884-4148-977f-a3450ceaee82@leemhuis.info>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 11 Jun 2024 14:39:01 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hjQVy0OM9okhGRiR_hXLjksn2aDcRd61dyKkdHCn3Qhg@mail.gmail.com>
Message-ID: <CAJZ5v0hjQVy0OM9okhGRiR_hXLjksn2aDcRd61dyKkdHCn3Qhg@mail.gmail.com>
Subject: Re: [regression] ac and battery readings for asus laptops (gu605)
 broken since "ACPI: EC: Install address space handler at the namespace root"
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 1:48=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> Rafael, I noticed a report about a regression in bugzilla.kernel.org
> that (if I understood things correctly, which in this case I'm not
> entirely sure of) appears to be caused by a change of yours:
> 60fa6ae6e6d09e ("ACPI: EC: Install address space handler at the
> namespace root")
>
> As many (most?) kernel developers don't keep an eye on the bug tracker,
> I decided to write this mail. To quote from
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218945 :

Thanks for forwarding, I responded in the BZ.
