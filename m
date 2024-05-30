Received: from buxtehude.debian.org (buxtehude.debian.org [209.87.16.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100DAA944
	for <regressions@lists.linux.dev>; Thu, 30 May 2024 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.87.16.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717055291; cv=none; b=jz5c5NhS9oiywyK/CDQR891y1Vbds75Nn7AlzjggLewimp3gseYbnB14n/2JDWzDGnKbTrQVEu3lJkBxNF2cTJiVlVw1OHKlKdG1Ul7DipRZJjP++Nd2sX25Vnkuu39MJJeJxlZOsEUAhA2UbY94n6RhoMEEoRgB2SOQ1mojDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717055291; c=relaxed/simple;
	bh=9seeePNhny6NI0ojkiPM65NhHPJnuc5yTi/U7314PNI=;
	h=Content-Disposition:MIME-Version:Content-Type:From:To:Subject:
	 Message-ID:References:Date; b=lZbQBcuGtEee6k8LLNlxQGmVFuvwTXWqeuORbTwYVTLql52JdeZ4jwvxBWUdRQTsBURxPZKc4jCL/05LF3fS1jm8ycIjI0PxLze9MJRh1zoLp+Bn0WYIw+EFjPA3Jgsj9QB8x7NRUHX8HfQUalVImMjGdV3XpHWBlyXCjYEOykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bugs.debian.org; spf=none smtp.mailfrom=buxtehude.debian.org; dkim=pass (2048-bit key) header.d=bugs.debian.org header.i=@bugs.debian.org header.b=M5eOJU7T; arc=none smtp.client-ip=209.87.16.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bugs.debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=buxtehude.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bugs.debian.org header.i=@bugs.debian.org header.b="M5eOJU7T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bugs.debian.org; s=smtpauto.buxtehude; h=Date:Reply-To:References:
	Message-ID:Subject:To:From:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Cc:Content-ID:Content-Description:In-Reply-To;
	bh=9seeePNhny6NI0ojkiPM65NhHPJnuc5yTi/U7314PNI=; b=M5eOJU7Tfe15RQ8nMExgK2BYj9
	VrgG5RwokFWPYcuSMZ0nThk5bQmiR4XriZjm/wRJRFxSe6H9+jVvVIrEoxCV2SgePWmnW2Gl3ghb0
	9q78qccB1nfzCcvV7zld2VI0lgElXG5xx+6Bcs6/vBh3xS5yfJqW45i0uwDdOtToe82ngbIQhzuPU
	Chq3M0N5LrNXNpQ1xoOTEcJJ77uy2d+aZfcKRRXVAFul5YOAizea8ljeX325pYmljK3iBuQ7Z2F+U
	u9O7gvceGebV9trjCTahxMsd1mxO1BXGxe5jKb47+b5HmcPJb3WvGelFXXkiAn9s72gpsyEHRoP0m
	HdkYjO4w==;
Received: from debbugs by buxtehude.debian.org with local (Exim 4.94.2)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1sCaW2-00FyPC-Vh
	for regressions@lists.linux.dev; Thu, 30 May 2024 07:48:02 +0000
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
Content-Type: text/plain; charset=utf-8
X-Loop: owner@bugs.debian.org
From: "Debian Bug Tracking System" <owner@bugs.debian.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Bug#1071378: Info received ([REGRESSION] commit fbf6449f84bf5e4ad09f2c09ee70ed7d629b5ff6
 (Linux 6.7+) crashes during boot)
Message-ID: <handler.1071378.B1071378.17170550483806030.ackinfo@bugs.debian.org>
References: <4611b3c8-0ef6-4951-8b34-10a1c7262355@leemhuis.info>
X-Debian-PR-Message: ack-info 1071378
X-Debian-PR-Package: src:linux
X-Debian-PR-Source: linux
Reply-To: 1071378@bugs.debian.org
Date: Thu, 30 May 2024 07:48:02 +0000

Thank you for the additional information you have supplied regarding
this Bug report.

This is an automatically generated reply to let you know your message
has been received.

Your message is being forwarded to the package maintainers and other
interested parties for their attention; they will reply in due course.

Your message has been sent to the package maintainer(s):
 Debian Kernel Team <debian-kernel@lists.debian.org>

If you wish to submit further information on this problem, please
send it to 1071378@bugs.debian.org.

Please do not send mail to owner@bugs.debian.org unless you wish
to report a problem with the Bug-tracking system.

--=20
1071378: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1071378
Debian Bug Tracking System
Contact owner@bugs.debian.org with problems
