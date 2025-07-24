Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C1C25A2A7
	for <regressions@lists.linux.dev>; Thu, 24 Jul 2025 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351163; cv=none; b=Tz6DA6BG/CyxilSGiWuZePnC0mdhwBrXIOn6Z8Fgz261Jo95tSH971IwXwXYKYVFe2uIEWnLz/C65IvcsaktMSODM71PGD8UQX/pWse/qd8s0Q5qke9J/0SPVPmv6RNieWMWMGaEuWZcrxHopfpA4dVKwPyPsuZel5ex13gZQUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351163; c=relaxed/simple;
	bh=Mb7Inz480w151UZyKAwiCb96cBzXuYWMullMv0nJPVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VN5t1SQQwl3I3A6VPlNF/f/9o13MMReR7eCePoE9JCMe3XTMhfYaLRfcahg17wHT6Tsh0HNesNVZ5FpjDgeXp5lAnELTepeMSUioAOfmSs18msR43ZWXJFCIdwQ0fng3/i5yaLDFWyB2C8ERns4AtMbNHegXH9gQROUzlye19XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+9dFiXW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+9dFiXW"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so1145625a12.0
        for <regressions@lists.linux.dev>; Thu, 24 Jul 2025 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753351161; x=1753955961; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4UaKwh5IJYpiaFnLbein8rzkhfpQ+t8tr+rzAQBDK48=;
        b=B+9dFiXW0PDkfY5NI2WDsC13shubCCLX7BFZApP6Zl4r4R6iHBAgnHcFosuJpzW6vC
         dqO5Bf5pMiDoBiShQ5k80BLlbOoCbhPnv4KUN7tkQb8UsDnCnSxGGA93Xx85et373uPd
         31EcRsgsY+qWQ7doSh5QA9vBSSPbJV66+QDzNPpC5Vb6PXV8ZI8GYI188PokYjXfjWUC
         HLhAACJ2un2YUTrE/QnkE1KEAgVxTUUvuplPQg18SybOn4WGwR6Gvp1O+V3duJns82Qq
         V7pB6K6LcixuN8A08n7yAhmdnBHnW7iZIFWrehbFzIdx8rO7RTQtjkA/siBrywzEuUCg
         aC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351161; x=1753955961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UaKwh5IJYpiaFnLbein8rzkhfpQ+t8tr+rzAQBDK48=;
        b=g1r85v5UyaA5GYoqYumrtRZVqrGc4TcM6B9tpGashotMyMBZVX5ojmwpu7DGlaGXWE
         tmPa6xGBReCOkSeRjHl7ipsMI0YdHyfHn9FFFVEpQgRolw3sz33M7THKGpnVHE8iHVc+
         RWpb1DMs0OCGXli0LvbnkR0mfQVQK/VP8j7hzHb8aXithM8C82lztljDBYJ+KrFH3TJk
         vnz+OcqBOhaB5D4RWqiZ0/eJrm4KyjAu67jHrBdo3CpZvU81kHG70tCtegpgVVe9YUwM
         em4OwkAx+lj1ShBRkgeKCdHRdUvNBwsQbuBtP/21u1CllEYuuYgfW8bVpoTcwtVxrYwv
         UAWw==
X-Forwarded-Encrypted: i=1; AJvYcCVmN18qTQ4faX0Vb8CRzww6TsP2eHvek/w355SlwWKfkHQ2p7w9VWHGtsMzD1jGUYp+7LeDMwMR7QaImw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKWXnWAx/HkHCV6zHtP+8Rjl0uTrBGcpix0X4am98xiUmss4c8
	1mWn0dOZyj0ku+areJeY+YI0a8MlG6pc4aoB88GJHfdoNREAS8HEdv6+jH4FlzYMQzqU/8r1QNQ
	SSzYaLGE0OC66gOD/78qvg6ufPv74/7B5ZBoWc2DpJQ==
X-Gm-Gg: ASbGncve6zrEwMkX1oeailBGrTZlrOACpxxmYL1Q4I44KX+OjAe4eSyOmpiErWI2d6/
	8/RadXHJii60hjUGrNdFDJD1IhARbDGfVpKL4sUhmxCwH1ik4HJitdG8LzR8RHGJG5jFKuReQnS
	EzXxBP9mOP0VugO+sPrO4mpDoLo6/nCbOUM5DMnzbA/q0AXGir2kRYIStWHMdFGVrpgyyoVGNBr
	ZNSXMUgQ3jcFRe1gLfFNWMy65ZRsOkrJ69K8f30
X-Google-Smtp-Source: AGHT+IGgBbqETCdYXqkCDv3Xdf3DYFAHcB3/99F/8XFC3iGfdWKp9wQNATBmpOAYkeL/nrq+kCpX+uoUSEHtoaSUEbk=
X-Received: by 2002:a17:903:3bc7:b0:23e:3249:612e with SMTP id
 d9443c01a7336-23f981a0b45mr94173785ad.34.1753351161461; Thu, 24 Jul 2025
 02:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com>
 <ef216301-a7e6-4c9d-9153-8ce8b0a4111f@app.fastmail.com> <4f506337-3481-41db-a2a4-5b4676f22eda@quicinc.com>
In-Reply-To: <4f506337-3481-41db-a2a4-5b4676f22eda@quicinc.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 24 Jul 2025 15:29:10 +0530
X-Gm-Features: Ac12FXwSH-tonDffdzQola6o5OJixZN0fswngpNfmWoStiUzFGt6E6s4psUF8ng
Message-ID: <CA+G9fYuGdo0MUeF0Du3oAtwzYQZhc999pBrz5x5v9P4qw0UbTQ@mail.gmail.com>
Subject: Re: arm64 dragonboard 410c Internal error Oops dev_pm_opp_put core_clks_enable
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, quic_vgarodia@quicinc.com, 
	quic_dikshita@quicinc.com, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Benjamin Copeland <ben.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Jul 2025 at 18:58, Renjiang Han <quic_renjiang@quicinc.com> wrote:
>
> On 7/18/2025 7:28 PM, Arnd Bergmann wrote:
> > On Fri, Jul 18, 2025, at 13:13, Naresh Kamboju wrote:
> >> The following Boot regressions are noticed on the Linux
> >> next-20250708with gcc-13 and clang-20 toolchains for the dragonboard
> >> 410c device.
> >> [   12.629924] x5 : 0000000000000002 x4 : 00000000c0000000 x3 :
> >> 0000000000000001
> >> [   12.629939] x2 : 0000000000000002 x1 : ffffffffffffffde x0 :
> >> ffffffffffffffee
> >> [   12.629956] Call trace:
> >> [   12.629962]  dev_pm_opp_put+0x24/0x58 (P)
> >> [   12.629981]  core_clks_enable+0x54/0x148 venus_core
> >> [   12.630064]  core_power_v1+0x78/0x90 venus_core
> >> [   12.691130]  venus_runtime_resume+0x6c/0x98 venus_core
> >> [   12.817608] Code: 910003fd f9000bf3 91004013 aa1303e0 (f9402821)
> >> All code
> >> ========
> >>     0: 910003fd mov x29, sp
> >>     4: f9000bf3 str x19, [sp, #16]
> >>     8: 91004013 add x19, x0, #0x10
> >>     c: aa1303e0 mov x0, x19
> >>    10:* f9402821 ldr x1, [x1, #80] <-- trapping instruction
> > It's loading from 'x1', which is an error pointer ffffffffffffffde
> > (-EISCONN).  The caller was modified by Renjiang Han (added to Cc)
> > in commit b179234b5e59 ("media: venus: pm_helpers: use opp-table
> > for the frequency").
> >
> > The new version of the code is now
> >
> > static int core_clks_enable(struct venus_core *core)
> >   {
> >          const struct venus_resources *res = core->res;
> > +       struct device *dev = core->dev;
> > +       unsigned long freq = 0;
> > +       struct dev_pm_opp *opp;
> >          unsigned int i;
> >          int ret;
> >
> > +       opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> > +       dev_pm_opp_put(opp);
> >
> > Where the 'opp' pointer is the error code and gets passed
> > into dev_pm_opp_put() without checking for the error condition.
> Thank you for pointing it out.
> I have submitted the following patch to fix this issue.

I have applied this [1] patch set on top of the Linux next tree and
performed testing. The previously reported regressions [a] are no
longer observed.

Thank you for providing the fix.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

[1] https://lore.kernel.org/linux-arm-msm/20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com

Reference link:
[a] https://lore.kernel.org/all/CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com/

Lava test job link,
 - https://lkft.validation.linaro.org/scheduler/job/8366971#L2573

--
Linaro LKFT
https://lkft.linaro.org
