Received: from buxtehude.debian.org (buxtehude.debian.org [209.87.16.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333B922069
	for <regressions@lists.linux.dev>; Wed,  6 Dec 2023 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bugs.debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=buxtehude.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bugs.debian.org header.i=@bugs.debian.org header.b="vM5GP2yv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bugs.debian.org; s=smtpauto.buxtehude; h=Date:Reply-To:References:
	Message-ID:Subject:To:From:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Cc:Content-ID:Content-Description:In-Reply-To;
	bh=M8ryrLHKnGhOOpG4u8DHjzLiwZHDZdjSsUtCvI+yBOI=; b=vM5GP2yvZC6drlLgjeqH7YUuBz
	1C4zuIBnbL7ney0Ej7/bER47wKyp8mRIVBYdad0ZpT9H5V0IM0ThS+Cw6RhmY6nHWR5GZ5clYDYa/
	eU+he7stnPJIkhhBtIfEEvD3Zv4kcxfNxF6e4qZxTL4JX5xgEEEDzALk+bUOae2BnDN6d0bVdw6jq
	eSFqY5RInWJRIOP1PE/Pq82Hul/tIbCZm1SKKZBMCaygDe8R8TeJF7qNqC8nXwe5W+XRgwgGbPiWA
	z54Z6hsezYsuQ6jbQ4/fgmQk1OzMW0Oap3EdDHpRgCidrqiKYbdSq4C5HmbTWW10/HIGoNU8OU23H
	BgnXzT6Q==;
Received: from debbugs by buxtehude.debian.org with local (Exim 4.94.2)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1rApOp-009dD1-CF
	for regressions@lists.linux.dev; Wed, 06 Dec 2023 10:45:03 +0000
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
Subject: Bug#1054514: Info received (Bug#1054514: linux-image-6.1.0-13-amd64:
 Debian VM with qxl graphics freezes frequently)
Message-ID: <handler.1054514.B1054514.17018592042293642.ackinfo@bugs.debian.org>
References: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
X-Debian-PR-Message: ack-info 1054514
X-Debian-PR-Package: src:linux
X-Debian-PR-Keywords: upstream
X-Debian-PR-Source: linux
Reply-To: 1054514@bugs.debian.org
Date: Wed, 06 Dec 2023 10:45:03 +0000

Thank you for the additional information you have supplied regarding
this Bug report.

This is an automatically generated reply to let you know your message
has been received.

Your message is being forwarded to the package maintainers and other
interested parties for their attention; they will reply in due course.

Your message has been sent to the package maintainer(s):
 Debian Kernel Team <debian-kernel@lists.debian.org>

If you wish to submit further information on this problem, please
send it to 1054514@bugs.debian.org.

Please do not send mail to owner@bugs.debian.org unless you wish
to report a problem with the Bug-tracking system.

--=20
1054514: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1054514
Debian Bug Tracking System
Contact owner@bugs.debian.org with problems
