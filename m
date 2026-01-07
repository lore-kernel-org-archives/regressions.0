Received: from natrix.sarinay.com (natrix.sarinay.com [159.100.251.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B13054D8
	for <regressions@lists.linux.dev>; Wed,  7 Jan 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.251.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779511; cv=none; b=NZaCfyzdIS9xjXW4YedUxwqocMyWaIEyrPCnfQ+L8W1zXFynXJQbTMhqCwqQ6jSSJFmccW8dM/X1m1EOLFQo0DTrs5Fxi4IaYpFZi2XhSx75SOohcwnwc9B4PGSSfGJs/BgiTFiXxQ0TXYqaWplGK2Xw+aEcEeSKYsF7pQfnnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779511; c=relaxed/simple;
	bh=nE5xqdgsLdwjSBCDkh9NrAinC8GAJWzhSEOF62kybxc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cKJdewlMGtGpJTl/6o/6qHQP8deXiUT0bKlhIt7CMMYCgt4EYcEuzVdCE/58BGPJ4+auVOxaGJ1hZ14QfRsKL/1FNiqkL6jTZbFFUMBZ5baKELuSfeTi4/ujIxwCEYnA3giyd5M3MfB4V6PwRm9N6KeYPXklfnsw6/Kgj+rKJkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sarinay.com; spf=pass smtp.mailfrom=sarinay.com; dkim=pass (2048-bit key) header.d=sarinay.com header.i=@sarinay.com header.b=k5MAatyg; arc=none smtp.client-ip=159.100.251.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sarinay.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sarinay.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sarinay.com header.i=@sarinay.com header.b="k5MAatyg"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sarinay.com; s=2023;
	t=1767778890; bh=nE5xqdgsLdwjSBCDkh9NrAinC8GAJWzhSEOF62kybxc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k5MAatygne1vwEa/WKKs0N+JGqvIvXzEvORvNM00jNfhVl74wJ0SWirCSb0cCsHkX
	 zD9QGd2ko9Y9LqU5QBm6MlxZoh5vYC+Ozg+oofm7Y+DISvfxcTll0/8PCO4nE8KozQ
	 r3nSt2FB5dKhEFE8kHS7EFc3IY4zIErAI+LhT1UBH10ybLWeaFkYNfaMw40shQDH6J
	 dDhpOeAYvHvrRgpPq35FCVLOkTwlCulE3pZGzosomAKGrFm20VSTP7hJhfI726TMKK
	 J2akg5PUN4aw5Lj3n758k6S/L5JOJfuh2Wejcp9Toy86dQiGw97wTj7moAWU3liPgB
	 V/YnqNzr5zL+Q==
Message-ID: <4ece65a62bac434de260896d208fcd9067185b4c.camel@sarinay.com>
Subject: Re: [PATCH net v4] net: nfc: nci: Fix parameter validation for
 packet data
From: Juraj =?UTF-8?Q?=C5=A0arinay?= <juraj@sarinay.com>
To: Michael Thalmeier <michael.thalmeier@hale.at>, Deepak Sharma	
 <deepak.sharma.472935@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Simon Horman
 <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Michael Thalmeier	
 <michael@thalmeier.at>, stable@vger.kernel.org, regressions@lists.linux.dev
Date: Wed, 07 Jan 2026 10:41:30 +0100
In-Reply-To: <20251223072552.297922-1-michael.thalmeier@hale.at>
References: <20251223072552.297922-1-michael.thalmeier@hale.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-12-23 at 08:25 +0100, Michael Thalmeier wrote:
> Since commit 9c328f54741b ("net: nfc: nci: Add parameter validation for
> packet data") communication with nci nfc chips is not working any more.

The commit broke existing user workflows, should therefore be handled
as a regression. Please consider reverting it until more refined
validation code has been thoroughly tested.


#regzbot introduced: 9c328f54741bd5465ca1dc717c84c04242fac2e1
