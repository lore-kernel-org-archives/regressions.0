Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762217A31E
	for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 01:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770060; cv=pass; b=hrVc7Di9hAPkub2oVNK8aT6SR6imMHN9JEPDHZgFowF4KZsfo+9Mac7JTox9E17mfYyxsBmDu/lMPkagkb5FZaKRzdo5iW41LDSsJ9GDu7bTWPEkcm2rjq4X0FCIDOm0X1+QhZzbxfzWHC+ko5gmSB3NtduP0aQH6oe1EPNOeys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770060; c=relaxed/simple;
	bh=M8BSWOVS+RaG1ZHT0qFAtozb/tlIs+3LQLjEh4n44Oo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jhJB3rPIh0Lk5O5uC3R0rUlbvstRQDdTgvUp5UlLq+lzVjeDUqi6rO/EtPB6IvuIe8nJuinimD5wVXpO/Bo4tPp254Y6LH+CrFFIbhgi5g8x37V1CTFpEafsaKB9uX5fYAtrJPhlgmjPohSx0NJFscKOCuJ0he60sXCRegIVRUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=obets.net; spf=none smtp.mailfrom=obets.net; dkim=pass (1024-bit key) header.d=obets.net header.i=@obets.net header.b=kY6UC/eP; arc=pass smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=obets.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=obets.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=obets.net header.i=@obets.net header.b="kY6UC/eP"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4a46a53abc9so59314b6e.3
        for <regressions@lists.linux.dev>; Wed, 22 Jul 2026 18:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784770057; cv=none;
        d=google.com; s=arc-20260327;
        b=XuNRiduc5+4Wet+/h1EPvrmrrOXs/1r4dkalT4+X6XcfLZ9cYXqgxeg8A9EhZoB8vX
         YQbrmMCTHNQqnfbpnG8l2292y8xMYIJh8WJikRHzLT9FCuuY/eCyhvL4PMlH4HICFQRn
         OMHIsMCzuCjnzpBO85qbc+dg7+tVMYefMfbgc/X69+74DnJCpNCr6z7LYaXNdbBuYsJh
         KAcr5o8Nc0ImSAf4xvz/AIZFiUnih88x3CBeXMQNnM0jJf2uCKIRq0jxN4bplxOHcbMQ
         5Sb5XbZZ8wLU+71e1bEldAAQEnRP+conKP2T+nATzr6/eQQDBhkd7LrN2hFlk74nmBS4
         zPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=M8BSWOVS+RaG1ZHT0qFAtozb/tlIs+3LQLjEh4n44Oo=;
        fh=Hi51YWuPkGPl+o+QQFCkEuCgNPef+ggQN7GkeY6Y8Uo=;
        b=O+0H1s6vzSQ3Zwi3YojgQeF3hyDCcKWC09SutkIqqNrkstemW9YVY9GGn9jYQlF6Ys
         j9gMS1C8ZwLi/dpW4lGVyA1+Lyt2FVApL5WF/LnWKgqrbC6x7/iGf1t696yCYILhhI5y
         GNT1oG232dxbR+62Fs/hvExBLYlbqaIM7IF/+pbw1tu2WBaa14hfg1jZQsRs78FBRVc/
         g0pTbrWhUYy3oVr/CpF9aGiOs64Jt1AmqowHY49w4LZyMH8OiQIgahsIqhu//9KHR28r
         YZIRNgqEnBTtPx8IZ3w7cwuuGyaY/58SRoB7QrRLHvAsW1TkXYLQKv+P7fAURv/9jmCZ
         91Hg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=obets.net; s=google; t=1784770057; x=1785374857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8BSWOVS+RaG1ZHT0qFAtozb/tlIs+3LQLjEh4n44Oo=;
        b=kY6UC/ePMoHh5H2D+ksRvbwT1lOwNhtrjPcOT5KLzlRD1GIlStZW0np7PEcxf01yFX
         7YbW0Gjl6M9ex4XEd6OFSzKR9GZ4MatSwMq8ZRxkGfZp+/8JZErBfcHgpI9LsiYgQl9l
         IIemtDKbdKvaJfFuy8rFVpObHLDeTVHxZEbIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784770057; x=1785374857;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8BSWOVS+RaG1ZHT0qFAtozb/tlIs+3LQLjEh4n44Oo=;
        b=ZKD7LlH/yJTLWgQ0HzdtbLx6QZbvWtMzLb8DkOpEphTwTL6SAelwghU/dl/Mc3QNAf
         vukuvG7tFKAAk+apJnw6Eo+hcPTR0nyJbO3C37W8uVD1+SErQ34zyWgzFDOv57TeLQat
         vzosXLAeo9LwdDQkVCnXklVbkvDhkIH9SvsAUQv3MtfvTS5S95y2XLM1/MUbaHBoR+cu
         jZUq7Q6pPVnHxTZxpVXoFue9Ef96eMl1CTegdEkr15r7ak5O1AmkUEjaMDCXvmugVGWN
         BlkMTKZsmRfT9PLdIjPUW9cPcfYSOUZCoT4eGHTd5XelQQEaeMqgHjpX/SOUkHR8xqW3
         WHqA==
X-Gm-Message-State: AOJu0YwOgfVW27Ve8nVKhnSp31gMppqU+1fb9f72ry5MF24TpLdEjATO
	lVR0GjuWWyUl/meTC8HldTMsPnOpdT7b+/z0ZlAEfshV8kx/MjofAqx++vCVjVqo8ONziXaXP4u
	r7iK5sHGDWycNMsPQddzznxmIxnzSmR4cXRh5OHTkbnfpbhVrP9iDeLyeXw==
X-Gm-Gg: AR+sD13PLeitPHRggSTyWN486yBtTL7GKleEtfM5yrprqvUUqnn92A3XKHI9nx4Y3AE
	Ferwz4lRXBtoS8pvtahtRZ35ZqxaaFxUR5y1NJpMNylmf5llxIHLNdWM3YXaPxVRxYTebv92Wu4
	ZAeUt5v48gQnUuQbSApjiStgdySvrRsbjK8chWj52HGmh9X7sh5ovPcHEgKgvPPdrElXl1HyO7x
	iIu8fiDVsapjOqwNm2AyesaakaYHEJ34uHoCTNDTVPqWU7RDY2j8QzPVNKd5v9V6iavjleqAqt1
	rAfHkyfKKp4i+NjjIqIt
X-Received: by 2002:a05:6808:1405:b0:495:f104:d895 with SMTP id
 5614622812f47-4ab35718a48mr642898b6e.31.1784770057632; Wed, 22 Jul 2026
 18:27:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Matthew Obets <matthew@obets.net>
Date: Wed, 22 Jul 2026 20:27:26 -0500
X-Gm-Features: AUfX_mz_aYvl1-N2nppFgqnwfVtTFWIB8VpSR-MZkqjwD0RFogxTGnqabk911WA
Message-ID: <CA+UyQRutDUHbSSDv=MeNNXzSoKc_AWfhBzON0vjQ7Q9TP-Ujvg@mail.gmail.com>
Subject: Pixelbook 2017 display backlight with 7.1.x
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After upgrading to kernel 7.1 the display backlight brightness
adjustment stopped working in KDE on my Google PixelBook 2017.

Neither the keyboard brightness keys nor the brightness slider change
the display's brightness.

I'm currently running kernel version 7.1.4-202.fc44.x86_64

Please let me know if you need any additional information.

Operating System: Ultramarine Linux 44
KDE Plasma Version: 6.7.3
KDE Frameworks Version: 6.28.0
Qt Version: 6.11.1
Kernel Version: 7.1.4-202.fc44.x86_64 (64-bit)
Graphics Platform: Wayland
Processors: 4 =C3=97 Intel=C2=AE Core=E2=84=A2 i5-7Y57 CPU @ 1.20GHz
Memory: 8 GiB of RAM (7.6 GiB usable)
Graphics Processor: Intel=C2=AE HD Graphics 615
Manufacturer: Google
Product Name: Eve
System Version: 1.0

Thanks,
Matthew
