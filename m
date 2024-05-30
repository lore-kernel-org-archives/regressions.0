Received: from buxtehude.debian.org (buxtehude.debian.org [209.87.16.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73486F300
	for <regressions@lists.linux.dev>; Thu, 30 May 2024 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.87.16.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060686; cv=none; b=ilOGQ3+BqDvKzMcMjxn/4LbJUoM5V6or+RmDg1PKBpeejehw4TVgTMAHa6NX4x9dY/GJBpuACiR+vVHMu8hx85N3D0RzS2x0AX7WSjPxw1ywSKU3Y9dvzlhZELoTg4ptojar+0rjEIQ1zctCig7LcqFl2uetSHbB48WURumyaPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060686; c=relaxed/simple;
	bh=9seeePNhny6NI0ojkiPM65NhHPJnuc5yTi/U7314PNI=;
	h=Content-Disposition:MIME-Version:Content-Type:From:To:Subject:
	 Message-ID:References:Date; b=PYH9owkmMeqLiBH4d1J/ygX4Nwi4gXe7e/5WQxMJ0Igp8Xl5D0lKkdVgQi1BHBjkaQQFqKbig8X4pC2O8PiMtmmQTkmeFLHQbsHmL4NUWAGAZ+hH+P1sjRm9T9ABWkUUrn0Kl3Jo9a6znX4N3sV3oYutaVTWv5fs9++e0FyckK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bugs.debian.org; spf=none smtp.mailfrom=buxtehude.debian.org; dkim=pass (2048-bit key) header.d=bugs.debian.org header.i=@bugs.debian.org header.b=UMZSTAWd; arc=none smtp.client-ip=209.87.16.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bugs.debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=buxtehude.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bugs.debian.org header.i=@bugs.debian.org header.b="UMZSTAWd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bugs.debian.org; s=smtpauto.buxtehude; h=Date:Reply-To:References:
	Message-ID:Subject:To:From:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Cc:Content-ID:Content-Description:In-Reply-To;
	bh=9seeePNhny6NI0ojkiPM65NhHPJnuc5yTi/U7314PNI=; b=UMZSTAWdi2wkWQ7cQKqLNtSNU2
	chWAobHKhF+iNC9HPAa8bbTiD5NFOHnOvkIGFehQFbzQqnG+5vH+aL7tnhM8SwS0i444sgrPZ+woW
	F61sk84H4txQa3KuyKDZhGWv2llAvIcIju38xjwwkxFWzuEaXP937sjiQOUqlnLryJUHHSrC3ClKk
	yIdYj8JradSaZiFNrJXM7PNKKwCbBWVOf2o/qbgq1hlv1wN+dfCYaj0XA0bbBlYgt9XN/7WFiGQ3O
	6QPDMtPfOJgJzHoNp3SltI0bz8troZbvAzdcKejL6cdBUUowueNyJcab2Zuv4rRemJm3XmVJENDLJ
	lK7sfiEw==;
Received: from debbugs by buxtehude.debian.org with local (Exim 4.94.2)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1sCbv9-00GAjU-4m
	for regressions@lists.linux.dev; Thu, 30 May 2024 09:18:03 +0000
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
Message-ID: <handler.1071378.B1071378.17170604553853269.ackinfo@bugs.debian.org>
References: <4532ae8d-b72e-4d76-894f-144910370f97@leemhuis.info>
X-Debian-PR-Message: ack-info 1071378
X-Debian-PR-Package: src:linux
X-Debian-PR-Source: linux
Reply-To: 1071378@bugs.debian.org
Date: Thu, 30 May 2024 09:18:03 +0000

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
