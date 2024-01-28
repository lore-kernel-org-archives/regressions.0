Received: from buxtehude.debian.org (buxtehude.debian.org [209.87.16.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07441EB22
	for <regressions@lists.linux.dev>; Sun, 28 Jan 2024 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.87.16.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706440150; cv=none; b=odCGt75TtIQfX2R5sEaCgvh4mF7NPaNxifUOE/7mGG4zRUa+ayKkZLB8F1exNwQaY4l6Nmwal4k/bCgEVMwc9aESyNYsnEsOE6WzftqN18rtoytdKG+NhOJJJnYxABjMFL1jRLdnCoFr9CyGQOglxhfTkBRA6P/jXEbn0z3XlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706440150; c=relaxed/simple;
	bh=qP6fta0BZBcAmberIv6Fs35laASLXpiznFIemiu4aIo=;
	h=Content-Disposition:MIME-Version:Content-Type:From:To:Subject:
	 Message-ID:References:Date; b=umMNs1CVxO6JGrTFoGZ6w1Hvv/9aZmhIeNz/4exOa+WekSiGO+iKzrjWeKzMnu056zS2BTXOOGdyDDa44uHvZszGRTdZIOzDvvCjIxXlk5rLz6weUlMlzXKIX92aLsbkT6DYy9hqW5K/gv3ngesJXMK+q1wVCCaTd29se1CXhms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bugs.debian.org; spf=none smtp.mailfrom=buxtehude.debian.org; dkim=pass (2048-bit key) header.d=bugs.debian.org header.i=@bugs.debian.org header.b=G6rtJ6mL; arc=none smtp.client-ip=209.87.16.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bugs.debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=buxtehude.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bugs.debian.org header.i=@bugs.debian.org header.b="G6rtJ6mL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bugs.debian.org; s=smtpauto.buxtehude; h=Date:Reply-To:References:
	Message-ID:Subject:To:From:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Cc:Content-ID:Content-Description:In-Reply-To;
	bh=qP6fta0BZBcAmberIv6Fs35laASLXpiznFIemiu4aIo=; b=G6rtJ6mLvmZleiicPScMC33Rl4
	H0pkg1QXHeEZEReQ1QwLFZTmjq3VoR2lT2GVzPhuHHjysWHMfl+8DrGM9fF232PEuTjUch/GSkrTG
	IFJ5UF5T3ozvfGMdMKAh2vgOCxv/A0OPCgacl6J1OTIRePtX/0nsErUbm2Etj1kbdr29EOPvKXvyH
	HW/NVSkuD6b/2PCxXamAeXOlALP9jas+8HZpxdqHZnUqxwo+J0e4DG8iIOFS4mTGO/k97zbJxdL53
	cEpugL3zMyaFEsS4hSUQIhf70RMmj5JgiXroaxaijjxIiO3/nyJ8/L+9OaeG8ddsQbJow2xXzTeRV
	7/OpmgwA==;
Received: from debbugs by buxtehude.debian.org with local (Exim 4.94.2)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1rU326-00HXt7-Go
	for regressions@lists.linux.dev; Sun, 28 Jan 2024 11:09:02 +0000
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
Subject: Bug#1061449: Info received (Bug#1061449: linux-image-6.7-amd64: a
 boot message from amdgpu)
Message-ID: <handler.1061449.B1061449.17064399874180112.ackinfo@bugs.debian.org>
References: <acf203a8-b612-437c-a464-228f45e1c694@leemhuis.info>
X-Debian-PR-Message: ack-info 1061449
X-Debian-PR-Package: src:linux
X-Debian-PR-Keywords: upstream
X-Debian-PR-Source: linux
Reply-To: 1061449@bugs.debian.org
Date: Sun, 28 Jan 2024 11:09:02 +0000

Thank you for the additional information you have supplied regarding
this Bug report.

This is an automatically generated reply to let you know your message
has been received.

Your message is being forwarded to the package maintainers and other
interested parties for their attention; they will reply in due course.

Your message has been sent to the package maintainer(s):
 Debian Kernel Team <debian-kernel@lists.debian.org>

If you wish to submit further information on this problem, please
send it to 1061449@bugs.debian.org.

Please do not send mail to owner@bugs.debian.org unless you wish
to report a problem with the Bug-tracking system.

--=20
1061449: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1061449
Debian Bug Tracking System
Contact owner@bugs.debian.org with problems
