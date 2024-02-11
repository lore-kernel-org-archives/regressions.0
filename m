Received: from mail.itouring.de (mail.itouring.de [85.10.202.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73A5B684
	for <regressions@lists.linux.dev>; Sun, 11 Feb 2024 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.10.202.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707667362; cv=none; b=YYaFe91RMfYsNnNRki/bkR3syNaz5xmEEgChRqBg5oJciN0CJOecaMg0kdnUDBgKQoasVhtxVAOKlaiYLOoZSdh1GrIg0OtI94FHxokeYHO0IO+WbPzGwFHOPrlR8dlnFgpSOXxo7DTy6NUhVfmkLOt6XGQJ19L/kdyduM22xFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707667362; c=relaxed/simple;
	bh=b/FTp5wr7CP8Mhnbmc++m9Krji2RO/vpS0OpJ7CX8NE=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IH4YOhhh/EJ82tA/xRnreOAjSaJnyRb7hEi7lHHatYAqQzH3VzyPZY/g101qh6pcywEZwhvDnvFprgr3w2KCm4i9lM33jZacE5vLpFkUP7rGKHcVLHrhnZaRGWCFDtj46rtz0O1fGg8421R3GjlorPjTs70uAjCVhzWnFj+YyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=applied-asynchrony.com; spf=pass smtp.mailfrom=applied-asynchrony.com; arc=none smtp.client-ip=85.10.202.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=applied-asynchrony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=applied-asynchrony.com
Received: from tux.applied-asynchrony.com (p5ddd7ec8.dip0.t-ipconnect.de [93.221.126.200])
	by mail.itouring.de (Postfix) with ESMTPSA id 86AAF103702;
	Sun, 11 Feb 2024 17:02:29 +0100 (CET)
Received: from [192.168.100.221] (hho.applied-asynchrony.com [192.168.100.221])
	by tux.applied-asynchrony.com (Postfix) with ESMTP id 31DCBF01605;
	Sun, 11 Feb 2024 17:02:29 +0100 (CET)
Subject: Re: I/O errors while writing to external Transcend XS-2000 4TB SSD
To: Martin Steigerwald <martin@lichtvoll.de>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-usb@vger.kernel.org
References: <1854085.atdPhlSkOF@lichtvoll.de>
From: =?UTF-8?Q?Holger_Hoffst=c3=a4tte?= <holger@applied-asynchrony.com>
Organization: Applied Asynchrony, Inc.
Message-ID: <5264d425-fc13-6a77-2dbf-6853479051a0@applied-asynchrony.com>
Date: Sun, 11 Feb 2024 17:02:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1854085.atdPhlSkOF@lichtvoll.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2024-02-11 16:42, Martin Steigerwald wrote:
> Hi!
> I am trying to put data on an external Kingston XS-2000 4 TB SSD using
> self-compiled Linux 6.7.4 kernel and encrypted BCacheFS. I do not think
> BCacheFS has any part in the errors I see, but if you disagree feel free
> to CC the BCacheFS mailing list as you reply.

This is indeed a known bug with bcachefs on USB-connected devices.
Apply the following commit:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/bcachefs?id=3e44f325f6f75078cdcd44cd337f517ba3650d05

This and some other commits are already scheduled for -stable.

Holger
