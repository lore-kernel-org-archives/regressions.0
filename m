Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86D3090E8
	for <regressions@lists.linux.dev>; Thu, 22 Jan 2026 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089298; cv=pass; b=WmLx0GG9aqXqFU7UgJe5SRq1nwPvV6kfuAs4+txph8UOZNdgQPTgd5wr40zCHfhUPQiL3R34BQWz02UX/yBqAeUIegk4xnPRJ73wKWUvyn6xSBQMTpUCB0rssnumIRiM1rsNmapF3KW03DV7xDovplayrmzpn/Z5ZexR6DdSNk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089298; c=relaxed/simple;
	bh=w2P21e8Xrn00dZ0P+iuyYVl+3bMyas+UXks6Iy2oCiM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hTD4+HoOr3aefj65Jx0mmRjdcOtsNigltl2QyjYNf4jOLztFRIgTTZAxmQE71BxWLVc5uTGOV3Y9+NvjgKblE+KPxX6Ry2MguE2m1mUmvZq09zYpHI6DhZqPQizVkkcbxOMGmPZyOQ5VirTT783Xc/zA/niraeks4Abd8ALEnKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nappairam.dev; spf=none smtp.mailfrom=nappairam.dev; dkim=pass (2048-bit key) header.d=nappairam.dev header.i=@nappairam.dev header.b=j356dHcR; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nappairam.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nappairam.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nappairam.dev header.i=@nappairam.dev header.b="j356dHcR"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6481bd173c0so928563d50.2
        for <regressions@lists.linux.dev>; Thu, 22 Jan 2026 05:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769089295; cv=none;
        d=google.com; s=arc-20240605;
        b=ZtA8keOtktItVqrv9fd50EwVlr1U3bO5lF/mDWI48Guq06S3DJKGSOpXdG3xAOFFTy
         V0fN6KSO/hs4LAmvYlCQ1RNpGHm0T4ms5m8c0SmKsR5bDwJxYfZ9W5vToIrNV/gyJWyC
         yhZQYbQzsgxWarKFKDkYhNJhc8fljMEKluTLKf4Yu7xIFYeYywliqDzP3GCHwlTcQKt9
         CKGGgExdI3Lo7Bn5o2a/9jM/hN3yrGkmjERsXvjnHRUpIoF+OzvaN3KGWjamV35Dd3QQ
         oqAGzfi+klNo9po5sSOIuFNDTNrjyGiVtIL//SRVTEg1Fo5RnUQWHWdutxsdXMoZEDg4
         k46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=w2P21e8Xrn00dZ0P+iuyYVl+3bMyas+UXks6Iy2oCiM=;
        fh=JnwBPECiX7SZ16zLNBPjKyf03cGC2xq9tpQeuUa0meE=;
        b=DPt1OB0+OS2JJjWT9SGI8bMq4cpd/9Vnvr6blbKOoo5y5QdkpXhEJKzl4Ttgazxdgd
         dKrnr8Pxb/NHkGPIp/+sX3afALzEtmMQ184m64rLvaJ5sm3iBHWvkFFma8zqDMvlwNmb
         gx18oHLNtu13xMD7EBqfVwrulmFsCtyv+E6q4xIUpWBdocxnYFwl4MnEATG1IwPDRoDK
         WLwyaWukH0VFkEjEJzoNeZcZmKcpbuXwlH9sRugt0EPJX9RJR6NLr3gIxQ57ahL4DeVr
         U3UVMuIpEKL7wOWELy/CBjRNYlP7YedXeHyiOdbml9AD17NUjxWU/ZzaQ/QF3JLcN0pj
         pVwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nappairam.dev; s=google; t=1769089295; x=1769694095; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w2P21e8Xrn00dZ0P+iuyYVl+3bMyas+UXks6Iy2oCiM=;
        b=j356dHcRAHwu+YhA+ZLxo8mGOLaDaB6mrVa7+iz88IRAzgoSOW4CicIBNMqXU/D4W6
         fCsiTcZDNMXpNBhvMKwFuap5vExHwzQbIHUBRjswm6uzYr8XVZRNfAE+YJSjso8lO8Ey
         EKhaOZOOPc6mT10w5xpxr+tIX+XadqguCjf4C/rdsDm4mnqqSBiEX8qYzQ9UDB/vaWqF
         U4ahUIvGXrygeGrqZ5SNu+d05HBfkkYP0dZ07+aesuAwMPi/Yp+mR0gIu+fDPcgFTJSq
         LBztSU5NQb4ESjPcPSaC9blDFcC6NgEh3kgQ/3S8vzGjVsfrPuLUKgDeZkBc6QE6Swec
         hvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769089295; x=1769694095;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2P21e8Xrn00dZ0P+iuyYVl+3bMyas+UXks6Iy2oCiM=;
        b=V4IaqDXdC8I7+7l39JnmOXY+VXASXKpMWolGKkOVTqMsXqwqRFMaGrsRU/y6KQncnp
         oW3J2GT4B+Sj2UWNl6I/i4w3twYxlyTVEOjjKCpcPlzp3jjlclakR9MuXNfv44REEwTu
         RsOgb8Rmmnk8aih78bhwoXCki8TT9tFtgac4ytUbK+yXyVS9Qfc7X1Lhc4Qm17Yz+R0/
         +L4eZGC/jRg3PcjmstvdMhy7Psq4H6QnRy5OIX4tOU1tbbsY/y+52DGVEkUYRFjdlUJR
         nDlJpC/oMS183Cw+gyR6V3eKNOLqWjbOyZPt+z0M34tAG6gJdXnKeYSUjJBUiA6lwhkq
         VmJA==
X-Forwarded-Encrypted: i=1; AJvYcCWzCtdODwEO6Mr2Rk22D45n8ZFYCioiPOmuHy93bnkL28zkzrOZuX04X0wQt2raBfNV0icRMyG/wyRJ5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyS+X52n0VIp28MhgWnnpXzVqJK1KhbOJrIevVwTe4M40zGolcf
	HeGWj0rzyUY+jWvhcSvQ6v7+vZur9thfJHdJJJo7N91jGvST12BECPnZY94vRzqPNVS/dEM0iOV
	HZg/Na06Du6o3VMNJ9m6qgQzZ3MFrAg2JyWufEkMqLp0=
X-Gm-Gg: AZuq6aL3XN/LsxVvSc8gYHE12L0PxNyhnlIerjBD3lA4yhorvrwEtQk8XvVsVRVCP4f
	P0gqKfxRJJi8UIr9V8boP6bC1vkKjtyswTxKben1p5s9Sg6LgoqZ8skXzwJG09yyM9GkLYfq+H7
	8CqwWqMcyHL5bnpskMkY48JRI/8cgIhvLypJd4pJYAdcAigwe+rhxuwK8uMPxLLVMq3y9/i0FBC
	CDOtlKk7wtCEK6DgtJdzgyAgBLlCCVDvR+eFwm1SeB+rE+jexh+gPA=
X-Received: by 2002:a05:690e:2545:b0:644:60d9:866c with SMTP id
 956f58d0204a3-64917773dc2mr12075758d50.93.1769089295468; Thu, 22 Jan 2026
 05:41:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mariappan Ramasamy <mail@nappairam.dev>
Date: Thu, 22 Jan 2026 21:41:23 +0800
X-Gm-Features: AZwV_QiZNeDZM11o-MKk_7KDA7mQ7yo_sasVTb9FNUuUgnOAyzlxMEQbDosuESU
Message-ID: <CAEc-AF7dobeSF+WEvZ0gZ9yS9j-6BS2pj=Ne3XWvW=SqK3558g@mail.gmail.com>
Subject: [PATCH] Please apply 1fb0d830dab8 to 6.18.y
To: stable@vger.kernel.org
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "ravindra@intel.com" <ravindra@intel.com>
Content-Type: text/plain; charset="UTF-8"

Please apply commit 1fb0d830dab89d0dc99bb84a7087b0ceca63d2d8
("Bluetooth: btintel_pcie: Support for S4 (Hibernate)") to the 6.18
stable tree.

This fixes a regression where Intel PCIe Bluetooth devices fail to
work after resuming from S4 hibernation. It blocks S3 sleep after S4
hibernation. The device loses power during hibernate and its firmware
is erased, but the driver doesn't properly reinitialize it on resume.

Steps to reproduce:

1. Suspend works normally before hibernation
2. Hibernate the system (suspend-then-hibernate or manual hibernate)
3. Resume from hibernation
4. Attempt to suspend - fails

Error logs:

Bluetooth: hci0: Timeout (3000 ms) on alive interrupt for D3 entry
btintel_pcie 0000:00:14.7: PM: pci_pm_suspend(): btintel_pcie_suspend
[btintel_pcie] returns -16
btintel_pcie 0000:00:14.7: PM: dpm_run_callback(): pci_pm_suspend returns -16
btintel_pcie 0000:00:14.7: PM: failed to suspend async: error -16
PM: Some devices failed to suspend, or early wake event detected
systemd-suspend.service: Main process exited, code=exited, status=1/FAILURE

After hibernate resume, the driver also shows restore errors:

btintel_pcie 0000:00:14.7: PM: dpm_run_callback(): pci_pm_restore returns -16
btintel_pcie 0000:00:14.7: PM: failed to restore async: error -16
Bluetooth: hci0: sending frame failed (-62)
Bluetooth: hci0: Opcode 0x0c01 failed: -62

I am experiencing this issue on a ThinkPad X1 Carbon laptop with
NixOS. Hibernation and sleep worked correctly in 6.17.x releases and
broke after upgrading to 6.18.x.

I have reviewed the changes in drivers/bluetooth/btintel_pcie.c,
identified this patch as the fix, applied it to 6.18, and tested it.
Hibernation and sleep work correctly again with this patch applied.

The fix is already in mainline (merged Dec 1, 2025) but has not been
backported to the 6.18 LTS branch.

Upstream commit: 1fb0d830dab89d0dc99bb84a7087b0ceca63d2d8

Tested-by: Mariappan Ramasamy <mail@nappairam.dev>

Thanks,
Mariappan Ramasamy
