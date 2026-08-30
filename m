Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE62D060D
	for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 03:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059656; cv=none; b=C5WO4Ma5GniRFeqIcreTRgVZy2CFaJA9J+c5fXUrNq1Sj8eItHD6jjZN5b1igY3M5MsPMKMvKbNRjOjA5HG5vR1w7zry5h9vxOysuQinlqdLzEo7djLIg1yMKJi3TqFzjBcnVn576ELjouc6EEZZMN8jVRqgdRVS1U366hagxn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059656; c=relaxed/simple;
	bh=AveADoKTyD0qMKs5efp/712wG89lKRLH/NKvKyDAXiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOhcNfxSw40SySZwEBYzzml45w4uy+tolVT2IxgfC5xjZCpVdFC2zttdaJraZTE7wEnd/vV+cQ7YZuuXSZCHop+8fAAGm79DwVGl7fus0Skz99j7hDpnFdzBj8KNGyO4zlAGnhdtrN3PTeLQcghyh3WuBmU9h5aZW7wfN6GD13s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDXXmY8B; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDXXmY8B"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c8e2e39easo35129331cf.0
        for <regressions@lists.linux.dev>; Sat, 29 Aug 2026 20:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788059653; x=1788664453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wqelshad8XAt0R3LlKAJqZNkTeXlB+pj6PSPch5MBY=;
        b=JDXXmY8BphT1qrKhmbQ2IwAZU+FMQYwa2qqzhdA5zasUtinhk7OxQrUZo6I4XMr7rx
         k9ezaP7JLqmJ8RuVxyUfZKzq1KaKzVLGwEYtESFqcrEOLPWm7LCxsqYjO8vSoDFWZ77r
         40YTI66pmW95eR7aZIO9SQETJHZMtwVn+8uG7MiNcZ27xKda2FKW7dmAEfCGmyud/m9H
         TQ9lLOTENVfXA8d678I7w22fyA8LNfHNgT7v0oOOS69RE/MG+XpJKHjayTNqb14p/Q08
         kvFQMD3SxqdKcq5iIF5q6DbVCtqb0iFs5VOd/FVb+XixLDfDIzds6fkltWxD8mLNqko0
         ZP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788059653; x=1788664453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wqelshad8XAt0R3LlKAJqZNkTeXlB+pj6PSPch5MBY=;
        b=hXBV72r/7ASDJF55cZ58pB1bRa+WYyBwDyPmw0n2f2zYpVoprZRkhg/hqEhnmi1e46
         hPektkkjk3xnUzW9w3NbmVFWBne9KmlIRuB+ifC1aPiqKP8Or3d2yTuCeXaFf2qOwNxN
         G0SZvKDrHd1kjmwpvV1MvG0+CNxce7p/UKuS7ZfFCvCnuOvq3XPu4tQ6BzEQPCDRmK5b
         KorGtM9RHHTinOM/s7HEYjEOmS2m6HZPy2geWtem1vIDmEI0cNFEDuMIaKzKT2EXLYFH
         3BVEu4QHLc1gI13IvI8a6XGPsNIEHplLwKILX+W08D/rClX2XQF7zYDjkgTqWbzb3Zl7
         0MIA==
X-Forwarded-Encrypted: i=1; AHgh+RpkJ0X92doLfQTOCosDdiR+Ng5FV2xOyc2HvRUrKuv5qbar7TZk08HejzgoE8pR1mR/CT6ugrQoMEehPA==@lists.linux.dev
X-Gm-Message-State: AFuF++l74erBhXck4GeparsOFTex7J/bq32Q4e2USnxuYU1iL0GfTFxQ
	13z0vP8zq/+1KYIi+wNPcL68Qlk0n/BtM+a0XOo+vjB5xU3jV7EuIsbk
X-Gm-Gg: AR+sD13VFDmFoOXABOiZJ9gFhXcFDxuuET61+Fm5Y9Y3DAdpnAie3OceHwZhOALQFfU
	1kvhe25RVynwxZAcp7Rj82FK9rPZsYlBSd8UVIv+p3e809tCVojwdQnwLt3Puk3syPb95vOFUDJ
	a3du3zOVw6OzFF6eib+ceq9GL0+aLjGsFkkMYp/9ljYaW722QZIPP8RnrWf3uW9c0rQ9zydQtoM
	iwpTCDee3gXonIVtgsdanCazKzMk03lx66XUHFG4WciSVD1cobJ5Imv5j8nqUnfWExXQIsPmQWf
	wHju2DtvhTO3E8npbU56+eOwyclW4eN3HaOarq7gWD+9BV8Y21MF/t72PyZIPsMMpAz1/s53D/7
	NJZnOgAcnQGUOtTyGrpoynLwSHNNhPOxELGUX9vEt0DAJPjtzK0N9sVSo6Zawkn7ilbAYZT7x9H
	LPoAeHUt4vRVH1tIUP/IijI6DEvURqmY7tbxbMETrH8J83gsrlMGxoL1ONDw6/+JVG2dn2rA==
X-Received: by 2002:a05:622a:5c0d:b0:52d:6c92:b5e1 with SMTP id d75a77b69052e-52fb95f7381mr255204331cf.27.1788059653044;
        Sat, 29 Aug 2026 20:14:13 -0700 (PDT)
Received: from ubuntu ([2607:fa49:6f63:9100:2b08:ba59:b738:ac34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe82f3b7sm44463631cf.21.2026.08.29.20.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:14:11 -0700 (PDT)
From: Pierre-David Belanger <pierredavidbelanger@gmail.com>
To: Shixiong Ou <oushixiong1025@163.com>
Cc: Pierre-David Belanger <pierredavidbelanger@gmail.com>,
	Shixiong Ou <oushixiong@kylinos.cn>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
Date: Sat, 29 Aug 2026 23:12:32 -0400
Message-ID: <20260830031233.1810986-2-pierredavidbelanger@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828105926.930033-1-oushixiong1025@163.com>
References: <20260828105926.930033-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I ran into this independently on x86_64 under QEMU and had a regression
report half written when I found your patch. Same one line, same reasoning.

Confirmed against vanilla mainline 08dbfad3f504, with v7.2 built from the same
config for comparison:

  v7.2 (8d3ae59288f1)           USB keyboard enumerates
  08dbfad3f504                  xhci_hcd does not probe
  08dbfad3f504 + this patch     USB keyboard enumerates again

The failure on 08dbfad3f504:

  xhci_hcd 0000:00:04.0: xHCI Host Controller
  xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus number 1
  xhci_hcd 0000:00:04.0: Failed to allocate interrupter erst
  xhci_hcd 0000:00:04.0: can't setup: -12
  xhci_hcd 0000:00:04.0: USB bus 1 deregistered
  xhci_hcd 0000:00:04.0: init 0000:00:04.0 fail, -12
  xhci_hcd 0000:00:04.0: probe with driver xhci_hcd failed with error -12

Reproduced with:

  qemu-system-x86_64 -enable-kvm -m 512 -display none -serial stdio \
      -kernel bzImage -initrd initrd \
      -device qemu-xhci -device usb-kbd

Both -device qemu-xhci and -device nec-usb-xhci are affected. Reading
HCSPARAMS2 from inside the guest gives 0x0000000f, so ERST Max really is 0
and max_segs comes out as 0 with the current code.

I did not see the page allocator WARNING you hit (my .config is a minimal
tinyconfig-derived one), but the probe failure and the -12 are identical,
and this patch fixes it.

Tested-by: Pierre-David Belanger <pierredavidbelanger@gmail.com>

Thanks for the quick fix.

Pierre-David
