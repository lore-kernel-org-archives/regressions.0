Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.125.139.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918993;
	b=odAt5ooZ20R+f80IeFsa/mk9BwO9o0Jiby5zE4FeTZNIFSt1PLX9DuvviF3Vaczf1xiD
	 eDmMQR/jpMGAdgEpfebxWJHt/mLZlmc0tswG8f6BtCJTc0BQKcqIjoZYn+Vpc031yfijc
	 ZE8uvoIJkyNvUFt9TN7LfKmsoYn4Esy9aR5vQddiKRAX48LfsnnlsXkxe9jfAUQJz93Cp
	 0EPXX5Hei9fo+jAR0Sa42fB/JYqSsCR+M71/NxKwitE1QnowcX/1QyASSZzz1vdDNMqVE
	 zs74PBLig98ZM9opCeo+70L0oddc+jfRFE6FMI7xImzhIJer5416J2QYqX9PJHtVihA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918993;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=YCCwTw1b8nC/676mldMf21YbE+d2YXPgrhLxfHmgduQ=;
	b=5CDah87bVs+0xPK3w0XkAfqJU+ZBU4Sia7CHHhvvzP8zEDvErZn8dPMA0L5MmvP84q/t
	 1ZkILeLHBakqUiQxW2xs5M36+bGAO9ZmPyw3ngwWaMkmCDJgWZt0P2IVwqz0aa7OLReFZ
	 pe2DnGKqe8H1xy5bS1Mmb9l32A0kQ7a9pGHdJs+rwGYx8uOr6lJx237hlKl/kZvrVUl7C
	 rpVtn0UZdqEU0MF29+veY3ob/SvUce5G0QLG7+Obk6ZeFeOnfp0x/1NZfY9nBlpMqN12G
	 wSqagPFq/8JGyi0d9LyYoX6py99R+vYnp4pdFWcpjOqyYoj4otD5CCLAUIsVEg+sO6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=fail smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=s1jp header.b="tFD/xxe8";
	arc=none smtp.remote-ip=211.125.139.72
Received: from jpms-ob02-os7.noc.sony.co.jp (jpms-ob02-os7.noc.sony.co.jp [211.125.139.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D67D606A33B
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 12:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D67D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=s1jp header.b=tFD/xxe8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1794918987; x=1826454987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCCwTw1b8nC/676mldMf21YbE+d2YXPgrhLxfHmgduQ=;
  b=tFD/xxe8aP1jSqQ1cu5zXhd/qiMudb3soz2UtgnYsWRXy7IDv2kJrnbi
   nELpDi3cdLsuL2LdR7ioybycP2t/BCs7ePPhkJgCevwL3jvJ2tilJpGep
   xhjnPud237aTgpT5ucLMn0jnIBWLGBbywhjnwz++UC18aQT023dCcnOgD
   spvaMjxLtgFTE0WuTDyAb8NImfi4abmMTPlD3v9XqHj+N1e5LdBHi1mB+
   8vhlDSsybTKdaRqLdZfIpVuUiyy2OKjnWyf5q2y49yh/vsjpadRkgIYj5
   x9RRaMzjsBUi7MzToc/J2hayYdd8QOmEtF3O55CIwhkZVJnTEiIJgl6yJ
   Q==;
X-CSE-ConnectionGUID: XDBRE53wRWekJ8FD0tiRqA==
X-CSE-MsgGUID: j1kRiI3XSCOkh5GD4/B6lg==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Nov 2026 21:36:20 +0900
X-CSE-ConnectionGUID: JZ/D7hrhQVaD8UBQVwoXlw==
X-CSE-MsgGUID: bMIQcZ8yTwmfVY+55+JU9w==
X-IronPort-AV: E=Sophos;i="6.27,166,1786978800"; 
   d="scan'208";a="71116498"
Received: from unknown (HELO jpc00229873) ([IPv6:2001:cf8:1:519:0:dddd:790b:411f])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Nov 2026 21:36:20 +0900
Date: Tue, 17 Nov 2026 21:36:10 +0900
From: Naoki Matsumoto <naoki.matt.matsumoto@sony.com>
To: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	regressions@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chenchangcheng <chenchangcheng@kylinos.cn>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sasha Levin <sashal@kernel.org>
Subject: [REGRESSION] 5.15.y, 5.10.y: media: uvcvideo: please backport
 5b9c75c794ce
Message-ID: <avxKOmxCBLF+7qdT@jpc00229873>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I use a UVC device of USB3 at v5.15.y. I found the frame rate down with
the below message after updating stable version.

    uvcvideo 2-3:1.3: UVC non compliance: the max payload
    transmission size (1729) exceeds the size of the ep max packet (1024).
    Using the max size.

This message is from by eb6059474e70 ("media: uvcvideo: Fix bandwidth issue for Alcor camera").

    5.15.190: eb6059474e70
    5.10.241: 3eaf16ff8165

kernel-5.15 supports usb3 of course. This problem is stream->maxpsize is
not support usb3. Since this function parses it directly, USB 3 support seems 
to have been overlooked. I found the patch at v5.19

Please apply 5b9c75c794ce ("media: uvcvideo: Undup use
uvc_endpoint_max_bpi() code") to 5.15.y and 5.10.y.

I confirmed that it cherry-picks cleanly and fixes the problem on 5.15.

#regzbot introduced: eb6059474e70

Thank you,
Naoki Matsumoto
