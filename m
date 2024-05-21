Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C5A20323
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716279341; cv=none; b=IGJ6rLDcDg3a7lIaZnuZgwNgfpja730vUZKnzXpOCVw2BiV+rF1MaFme6nd/4jH2MgN2davp4zOzW3O6nSli14RWOKBw63EeE1/tmk4EEjX3fpF9ks1al+jGEYJZJSfelVWVfosIcNlZUsYTPx/eye5aLXNyKqteAG2L5b1u+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716279341; c=relaxed/simple;
	bh=03NnX/gPP5q80BC4asuBpkqYVv98rLURX/ei/Ofcp+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPYRP/1MbLnwQvXwTYJfjT4o07uibD8ARs5So2sMr3SATis6CzelZssdgmnZJV3iXI/rNuyHE7dGbasD/hqdy4ydyBL8YJiW92uzLC5T4pRCwFpO71gRZ6JQS/WpFDJcdu4cmib/j7TowA1P/gC14SWQ6HvFGJuXgFESI91wDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Az7TItWH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Az7TItWH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f304533064so10986855ad.0
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 01:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716279340; x=1716884140; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fOkVqi2qkIsFMvRkB9KtVo2EQjUhNueVGG8DYcj/Qw=;
        b=Az7TItWHBWBWz3DsoPUjGY5rv2iAaf7bx8CfhM9wAk30wC9xIFGDQwmEupUNVgDQFH
         5zbD2rgjhhLTgxF39wAtCu6LISsZcwem1T9gho2GSTZcGftujcWUiEoep02kzIK/vH1+
         NlCEHYbTXqeQcraaK1OCR0v9YzFnCDFzHdf2x1RiyfF8p/wsFCopsf2SjH3cuCqa+6qb
         YsSTZIZ4g+zIbMSTiKZUD/lhIKOVCumtFHDJPPEw6gx88KOxq1HqrvqoB3kxht2rZ+Sd
         CUPZ875GJEPLJr/Et77kFx6+WNOp/eN1uQr59stuJ5vtFrBjo9fiCHR/L+q2VYMWjeEu
         +Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716279340; x=1716884140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fOkVqi2qkIsFMvRkB9KtVo2EQjUhNueVGG8DYcj/Qw=;
        b=AmOglOjQ2T2df8O/70no5b/2kraObwy+K207Egg4fCf18vCw5rggpt93bq5993HOhT
         oCkMk+hTVHSIE2lWNE0E7hrBdteh1RtzgnDaSmcZPyA956AUUFDn75SqZO6Y4L5Dh5yf
         oUjngTHaNDsWl7FM+Vxr+WCub3HvlZ3H7am0WnEg9oxVOnbnwLgakUfnHIf6nIBSygA9
         4c9vPVnLhCNarjFLEaTKWvNZBIZcQUGHdEBkpp1mOPI2NABcJXjWm2MQZzAblGp38vp1
         fVXS4X8xfaXQj2c9foH3Q86ak3Pl/Il+mRdUcdOp4Huph9fMlMdFx+IxJ1r26LvzN6ru
         EePA==
X-Forwarded-Encrypted: i=1; AJvYcCVSwoJW3VB4FzTXphk0j3u83CIcOPDmy9Umq26JEgAbCdXc7ia9PPKoTk+N68XKc9vtaekyv6DuMi/WuRcLyEwZIWVAELVtgubmduE=
X-Gm-Message-State: AOJu0YwOfCazc0ct9RRaT71sJsUpYpXBldsdPBS0vJR83cg3ia2aUeFR
	PzhwSRkGKv6p+Mggnfjxl9sleyae+kNfU52MVD5nUA90ua5wUfa/ngdPAU/317iq7btAJYmKT/S
	P87cFB4qKNVH8NaT/IeFHNDNI7gg=
X-Google-Smtp-Source: AGHT+IFLaQW9QKaaME5VziwLlJJd6X1Hm84dCjjfR3MMubkylS+O4mlXM2VIdqdXQQPwKtUSwl0vHOXPPTOvjnNnkeI=
X-Received: by 2002:a17:902:c406:b0:1f2:ef8f:8573 with SMTP id
 d9443c01a7336-1f2ef8f8ce7mr92016585ad.0.1716279339681; Tue, 21 May 2024
 01:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHe5sWavQcUTg2zTYaryRsMywSBgBgETG=R1jRexg4qDqwCfdw@mail.gmail.com>
 <38de0776-3adf-4223-b8e0-cedb5a5ebf4d@leemhuis.info> <lqdpk7lopqq4jn22mycxgg6ps4yfs7hcca33tqb2oy6jxc2y7p@rhjjbzs6wigu>
 <611f8200-8e0e-40e4-aff4-cc2c55dc6354@amd.com> <61-664b6880-3-6826fc80@79948770>
 <20240520162100.GI1421138@black.fi.intel.com> <5d-664b8000-d-70f82e80@161590144>
 <CAHe5sWazL96zPa-v9S515ciE46JLZ1ROL7gmGikfn-vhUoDaZg@mail.gmail.com> <20240521051151.GK1421138@black.fi.intel.com>
In-Reply-To: <20240521051151.GK1421138@black.fi.intel.com>
From: Gia <giacomo.gio@gmail.com>
Date: Tue, 21 May 2024 10:15:28 +0200
Message-ID: <CAHe5sWb7kHurBvu6JC6OgXZm9mSg5a2W2XK9L8gCygYaFZz7JQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] "xHCI host controller not responding,
 assume dead" on stable kernel > 6.8.7
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: =?UTF-8?Q?Benjamin_B=C3=B6hmke?= <benjamin@boehmke.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, Christian Heusel <christian@heusel.eu>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "kernel@micha.zone" <kernel@micha.zone>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "S, Sanath" <Sanath.S@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here you go:

0x0080 0x003c01c0 0b00000000 00111100 00000001 11000000 .... LANE_ADP_CS_0
  [00:07]       0xc0 Next Capability Pointer
  [08:15]        0x1 Capability ID
  [16:19]        0xc Supported Link Speeds
  [20:21]        0x3 Supported Link Widths (SLW)
  [22:23]        0x0 Gen 4 Asymmetric Support (G4AS)
  [26:26]        0x0 CL0s Support
  [27:27]        0x0 CL1 Support
  [28:28]        0x0 CL2 Support
0x0081 0x0828003c 0b00001000 00101000 00000000 00111100 .... LANE_ADP_CS_1
  [00:03]        0xc Target Link Speed =E2=86=92 Router shall attempt Gen 3=
 speed
  [04:05]        0x3 Target Link Width =E2=86=92 Establish a Symmetric Link
  [06:07]        0x0 Target Asymmetric Link =E2=86=92 Establish Symmetric L=
ink
  [10:10]        0x0 CL0s Enable
  [11:11]        0x0 CL1 Enable
  [12:12]        0x0 CL2 Enable
  [14:14]        0x0 Lane Disable (LD)
  [15:15]        0x0 Lane Bonding (LB)
  [16:19]        0x8 Current Link Speed =E2=86=92 Gen 2
  [20:25]        0x2 Negotiated Link Width =E2=86=92 Symmetric Link (x2)
  [26:29]        0x2 Adapter State =E2=86=92 CL0
  [30:30]        0x0 PM Secondary (PMS)

On Tue, May 21, 2024 at 7:11=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, May 20, 2024 at 07:30:28PM +0200, Gia wrote:
> > In my case I use the official Thunderbolt cable that came with my
> > CalDigit TS3 Plus and yet the log - attached in a previous email -
> > says current link speed 10.0 Gb/s. I just tried a good quality USB4
> > cable too and nothing changed.
>
> I will take a look at your logs today but in the meantime can you run
> following command on the system with the dock connected?
>
>   # tbdump -r 0 -a 1 -vv -N 2 LANE_ADP_CS_0
>
> Here tbdump comes from https://github.com/intel/tbtools. It should be
> pretty straighforward to build but let me know if any issues
> (unfortunately there is no binary package available at this time).
>
> The '-a 1' should match the adapter the dock is connected. You can get
> it for instance like this (this is an example from my system):
>
>   # tblist
>   Domain 0 Route 0: 8087:7eb2 Intel Gen14
>   Domain 0 Route 1: 003d:0011 CalDigit, Inc. TS3 Plus
>   Domain 1 Route 0: 8087:7eb2 Intel Gen14
>
> Here the CalDigit has "Route 1" so it means I use "-a 1" above. It could
> be also "Domain 0 Route 3" in which case replace the "-a 1" with "-a 3".
>
> This command should dump two lane adapter registers LANE_ADP_CS_0/1 that
> show the link capabilities.
