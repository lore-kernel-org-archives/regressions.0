Received: from buxtehude.debian.org (buxtehude.debian.org [209.87.16.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678547F
	for <regressions@lists.linux.dev>; Mon, 26 Jun 2023 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bugs.debian.org; s=smtpauto.buxtehude; h=Date:Reply-To:References:
	Message-ID:Subject:To:From:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Cc:Content-ID:Content-Description:In-Reply-To;
	bh=ZWlf8O4JhKlaw+vvqfJy7Oi55+rNsyoLZz5oDDmNf/I=; b=a3atm8RrPxb6ETOz/Gi8uo8HFj
	p6idUfh/W6F4WxYkCMklxBNTr1LlzNMpMmqKINfN6gzQvUxIg965/aTHSY/A747BmjJRpUa3WgC1v
	axVeLdhU0MQAOKhRhcTSM8gGY51KugKI7DVF6XZ+qIee8fMVkrEjaioswEqwhqlVa2DBCNcvECpQB
	T8rPNL1y+/wilx/ZZFciqyajVEziQdI2EldolYUPWf334/wLdANt1cXjGOXNeNnWPaG2xxRY3bHsI
	HklufIE9SY1wJfj6kJC6vPyAK87+Dx7DhQCzkR9SqyveUaKPvKoenKLSxcnbtZxV4P8IGWHDQ14nE
	fGtL7zzQ==;
Received: from debbugs by buxtehude.debian.org with local (Exim 4.94.2)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1qDlRr-007ul9-19
	for regressions@lists.linux.dev; Mon, 26 Jun 2023 12:36:03 +0000
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
Subject: Bug#1036530: Info received (Regression from "ACPI: OSI: Remove
 Linux-Dell-Video _OSI string"? (was: Re: Bug#1036530: linux-signed-amd64:
 Hard lock up of system))
Message-ID: <handler.1036530.B1036530.16877828091884631.ackinfo@bugs.debian.org>
References: <ed5f982e-c12c-b3a2-1108-62fba50bf9db@leemhuis.info>
X-Debian-PR-Message: ack-info 1036530
X-Debian-PR-Package: src:linux
X-Debian-PR-Keywords: upstream
X-Debian-PR-Source: linux
Reply-To: 1036530@bugs.debian.org
Date: Mon, 26 Jun 2023 12:36:02 +0000

Thank you for the additional information you have supplied regarding
this Bug report.

This is an automatically generated reply to let you know your message
has been received.

Your message is being forwarded to the package maintainers and other
interested parties for their attention; they will reply in due course.

Your message has been sent to the package maintainer(s):
 Debian Kernel Team <debian-kernel@lists.debian.org>

If you wish to submit further information on this problem, please
send it to 1036530@bugs.debian.org.

Please do not send mail to owner@bugs.debian.org unless you wish
to report a problem with the Bug-tracking system.

--=20
1036530: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1036530
Debian Bug Tracking System
Contact owner@bugs.debian.org with problems
