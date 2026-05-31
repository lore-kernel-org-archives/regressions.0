Received: from smtpo75.interia.pl (smtpo75.interia.pl [217.74.67.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD0349CD1
	for <regressions@lists.linux.dev>; Sun, 31 May 2026 10:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.74.67.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780224754; cv=none; b=aZtWCBPxIoMAmyj6TluNCBSqYqqljWDUmITd2fXIzEBGIEoWN7+rK0cwIOMwWQXwTNexrd5j8Nl53+VICj/CeY43V/OkvBaVdMN8P2yTTxAVia+mm52obj12aDK/reYoC/FyoVWU6tdb3qNZW2H+3HuY1dhaQTNlH8r0/K3qHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780224754; c=relaxed/simple;
	bh=23Hr6bVV2eGzZD4V9CAprmCqyNkeGDWQ61jdUyLqKXA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=TGue3+fzJFbxHV7SxX04UIC1GJXf843zMFjD4IjMxNG8051O/fZIqgJMM05lqXGG5RArVSYEfqmhHFjJQGRYrv8eBP5RbSBK6lPm9DbwyNsot0s78oLtg80eckFn8UISTxlpwoPCekY818YycYDplDT8bexGAxN02NFm+yDgTNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm; spf=pass smtp.mailfrom=poczta.fm; dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b=yssDv48P; arc=none smtp.client-ip=217.74.67.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b="yssDv48P"
Received: from Stacjonarny (62-133-144-026.dynamicip.ostnet.pl [62.133.144.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by www.poczta.fm (INTERIA.PL) with ESMTPSA;
	Sun, 31 May 2026 12:52:26 +0200 (CEST)
From: "Artur Chlebek" <achlebek@poczta.fm>
To: <amd-gfx@lists.freedesktop.org>
Cc: <regressions@lists.linux.dev>,
	<stable@vger.kernel.org>
References: 
In-Reply-To: 
Subject: 7.0.9 vs 7.0.10/7.1 Radeon 260X regression
Date: Sun, 31 May 2026 12:52:30 +0200
Message-ID: <002901dcf0eb$9472e210$bd58a630$@poczta.fm>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKsb98F3W6w4/I7L4gnl9a4wKSh5rSI9UcA
Content-Language: pl
X-IPL-Priority-Group: 0-0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1780224748; bh=23Hr6bVV2eGzZD4V9CAprmCqyNkeGDWQ61jdUyLqKXA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yssDv48Pev+PIQ+2CWFB85IQ+Bh6vUyB6EcyUY2JsblfJOKTNoUR7JLfmAhe6gNC4
	 dqvPb+ENrbHGkxt0B+x00HJ4DMy/YsPADm3FfDuKs0HmsHKhSqJllvi8Tlu5OG7HTU
	 s0rGTY07+HRX9nBmszgqidtRxpebVUdIXJG4X9fU=

Hi, I have 5x fps drop on amdgpu Radeon 260X 1GB between kernel 7.0.9 and
7.0.10 or 7.1rc

Original sparse mail got flagged as spam so let me elaborate:
Newest vanilla Fedora with Plasma, Gigabyte GA-H97-D3H, looked into things
like clocks, PM, ASPM, tried flags, GTTSIZE, .dc=0 - all seems fine nothing
helps.

Regards.

