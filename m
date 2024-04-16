Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFF956B7A
	for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 21:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713301620; cv=none; b=Au+ETeQ8bgaNRfktQgQ8IBw1c1hQNeB/hE/unsyIGYYahZXv8BlV980lWEsOtWpEKYbozXKHk4Rs641TZSgBhy8ue40VZFT/TjSJHo7ba7AplzNLrB/pFRjDHIdu7xgRZpGrwnK2iCk9igwFhAapVSNXXFD+0fAjloqlMN10I6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713301620; c=relaxed/simple;
	bh=RwjtoYD6cQt+OqmDr7ENump1TE2ni9S3O2nqP0uMSHc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9unX72RyILTqIYXB6vFaYtLgsVPuvQeyiukdTRe72mCV9lFqhSVTkp47mf/m98gxMXOvYH1bmbSono5argi7RfLxqoejixNN8Y0sB0sdpSx7PkqLahlrdfbre3ZDVF/7UmYQwpeYQGCYkbvgW5mBVG3FlLZKAt10NJnoHjyEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id A546A10195404;
	Tue, 16 Apr 2024 23:06:50 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3E0E91135D2; Tue, 16 Apr 2024 23:06:50 +0200 (CEST)
Date: Tue, 16 Apr 2024 23:06:50 +0200
From: Lukas Wunner <lukas@wunner.de>
To: regressions@lists.linux.dev
Subject: Re: 6.9-rc2: Deadlock on unbinding network device from a driver
 (regression)
Message-ID: <Zh7oavIWtk0CUuk5@wunner.de>
References: <ZhRD3cOtz5i-61PB@mail-itl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhRD3cOtz5i-61PB@mail-itl>

#regzbot fix: igc: Fix LED-related deadlock on driver unbind
