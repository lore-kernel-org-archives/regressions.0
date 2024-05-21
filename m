Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6571955C29
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716282743; cv=none; b=cxpP5aD4TJo2/Pd07Za0U+siK8gthIseIQW4I8OldEfpxUrb6+QFrP1e4I+OOzVfUdf6DO9XEgb8/5Rs0igI8OiQmWjXltpdILVL7NOo24/BTHZQcSnunoGMB6uTjdTDWGntw4m8o6M+6O2Elm+b/QC5dhAIoKSDwZMOQGc+inM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716282743; c=relaxed/simple;
	bh=2wjs3mdw4rOGvrIqoeda4h5sOrmnWs3RpnJdlvtjnio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHh03O2ExUpx6wuB+2ZRpztJtVGWQESu5FJSwsrIh5t5XdFlgb/nQtB0UdycXM8Hy2/0XOb1ZuTLP9pdTk0s82pIf8fn07DwmyWp4o031mxFDRdpHg7DbUhI2z/ajqBWzlhcxCApT34wO1b9wMWItEPnNqQJULOzVYej4DUHkxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMoAKtdU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMoAKtdU"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1edc696df2bso37514095ad.0
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716282742; x=1716887542; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFFc8dkP7sP+uu3rw1v9YarWpJd2vkJbAvnBTD0BiKI=;
        b=OMoAKtdUgjuxhoZeyLLnXZnSqYpuE3q7mMylNO1u5PnrE2DWHFoURy3Wx095vH9ged
         dlPUFqwSdQEmUPAx9CGYuuOmuD347bEhK5b7AZpMw0ckas5pYEAbHCw9u/8zyYGI32U3
         p+wIdR9JQXeSL1aEamyEDLhyO1A4OtJEueTGqSEZqBlhXMwQE84FIuZoDHtwEvM0XE3L
         pFS9jbxNLGsWMG+lNGFnofnl0CHS+n9NWacBkYW+duKiUVuyyXnUID7mAA7AzSxiLcnZ
         adtg19LXxM8Sv/IHIg4ISl8me1QdfW2dt4IMpFqCUhcm/+58H0EwkOe32iGYPUrsCmLH
         KG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716282742; x=1716887542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFFc8dkP7sP+uu3rw1v9YarWpJd2vkJbAvnBTD0BiKI=;
        b=JzjyK1SIYZK3saBduzdpO5eIMG+zJ1UIAGrfD7m9Ww4/FtVSajtt2oNX9bBc4U7TdO
         qVd92D0hwYPma4MMoe/qPR5fJruyoKCgZd/Eg4uFaSvKKL3UCNTh/nKsM6dF9ci80dlw
         VX4baBY4XB4PEu74MYEuHWnvDP/FP4zRe/OtF5A8W5BQOOFgfsEmwH/hwXogxoCHrK5T
         7AHE6g85LKwj36ckxZ7VCo32xc8lGHjBJALqx3cWowLULQEFCYjxpbDee7ZNWpiHjp4e
         /sgfCu3oW117dYctniBDfbKRDDndCq9paEJVF2QhzLH/OQ7d0t+NxsM0BjEcmUlyhIjQ
         RAsw==
X-Forwarded-Encrypted: i=1; AJvYcCXFukfYrKL5uRQNYGWO4m2+U7BKdwRyq2mBn7QZkncyYqaw8DpPaFytoRv1ir6CHN5tX0G09Fnj0tkTUKEVs+47boRgmJyJ99e9ChY=
X-Gm-Message-State: AOJu0YzSj1hswHDY5r3effMI+ipRTwuzFqJ3325I3XjU+Yur4zQxyNNM
	MO4hdwJn5TVv3q1EX5nTDLxFUvWf6n4iA5naXCrETxE5Ua+rs8/sf/TdHCmi3XX5h0jIF/TqcvC
	gdfYDQQkNUj1g2aJ8r+RtGvOPMsg=
X-Google-Smtp-Source: AGHT+IEZhwsCyczFPZJb/vjIbSf+CiTU9TdOAlzSwjvUCGMcHTAml6sMLqSnnpQ2+kd26Ga3oom9L2K9e7gZCCGVCrU=
X-Received: by 2002:a17:90b:2305:b0:2b1:782:8827 with SMTP id
 98e67ed59e1d1-2b6cc564325mr28630098a91.20.1716282741684; Tue, 21 May 2024
 02:12:21 -0700 (PDT)
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
 <CAHe5sWazL96zPa-v9S515ciE46JLZ1ROL7gmGikfn-vhUoDaZg@mail.gmail.com>
 <20240521051151.GK1421138@black.fi.intel.com> <CAHe5sWb7kHurBvu6JC6OgXZm9mSg5a2W2XK9L8gCygYaFZz7JQ@mail.gmail.com>
 <20240521085926.GO1421138@black.fi.intel.com>
In-Reply-To: <20240521085926.GO1421138@black.fi.intel.com>
From: Gia <giacomo.gio@gmail.com>
Date: Tue, 21 May 2024 11:12:10 +0200
Message-ID: <CAHe5sWb=14MWvQc1xkyrkct2Y9jn=-dKgX55Cow_9VKEeapFwA@mail.gmail.com>
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

Here you have the output from the dock upstream port:

sudo tbdump -r 2 -a 1 -vv -N2 LANE_ADP_CS_0

0x0036 0x003c013e 0b00000000 00111100 00000001 00111110 .... LANE_ADP_CS_0
  [00:07]       0x3e Next Capability Pointer
  [08:15]        0x1 Capability ID
  [16:19]        0xc Supported Link Speeds
  [20:21]        0x3 Supported Link Widths (SLW)
  [22:23]        0x0 Gen 4 Asymmetric Support (G4AS)
  [26:26]        0x0 CL0s Support
  [27:27]        0x0 CL1 Support
  [28:28]        0x0 CL2 Support
0x0037 0x0828003c 0b00001000 00101000 00000000 00111100 .... LANE_ADP_CS_1
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

On Tue, May 21, 2024 at 10:59=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Tue, May 21, 2024 at 10:15:28AM +0200, Gia wrote:
> > Here you go:
> >
> > 0x0080 0x003c01c0 0b00000000 00111100 00000001 11000000 .... LANE_ADP_C=
S_0
> >   [00:07]       0xc0 Next Capability Pointer
> >   [08:15]        0x1 Capability ID
> >   [16:19]        0xc Supported Link Speeds
> >   [20:21]        0x3 Supported Link Widths (SLW)
> >   [22:23]        0x0 Gen 4 Asymmetric Support (G4AS)
> >   [26:26]        0x0 CL0s Support
> >   [27:27]        0x0 CL1 Support
> >   [28:28]        0x0 CL2 Support
> > 0x0081 0x0828003c 0b00001000 00101000 00000000 00111100 .... LANE_ADP_C=
S_1
> >   [00:03]        0xc Target Link Speed =E2=86=92 Router shall attempt G=
en 3 speed
> >   [04:05]        0x3 Target Link Width =E2=86=92 Establish a Symmetric =
Link
> >   [06:07]        0x0 Target Asymmetric Link =E2=86=92 Establish Symmetr=
ic Link
> >   [10:10]        0x0 CL0s Enable
> >   [11:11]        0x0 CL1 Enable
> >   [12:12]        0x0 CL2 Enable
> >   [14:14]        0x0 Lane Disable (LD)
> >   [15:15]        0x0 Lane Bonding (LB)
> >   [16:19]        0x8 Current Link Speed =E2=86=92 Gen 2
> >   [20:25]        0x2 Negotiated Link Width =E2=86=92 Symmetric Link (x2=
)
> >   [26:29]        0x2 Adapter State =E2=86=92 CL0
> >   [30:30]        0x0 PM Secondary (PMS)
>
> Thanks this looks fine (although the link is still Gen 2). Can you run
> the same from the dock upstream port too?
>
>   # tbdump -r 2 -a 1 -vv -N2 LANE_ADP_CS_0
