Received: from out2.virusfree.cz (out2.virusfree.cz [89.187.156.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493523C511
	for <regressions@lists.linux.dev>; Sun, 24 Aug 2025 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.187.156.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756026475; cv=none; b=Esw6vo/fX02DKgo78yAKp5bSQoL8NrqY2EettqXb6GK3LUZPsBhFP+se7xuSSxFsQtUibt+rKDlsmaTxCXTf1gC7eKCA0lN64bt7QzULIkqI0WuQCUuuZwgtIwNBoK2sMS3dIdaSFi0k755K/Jo34VwUoQxfiIitAlhjaBPKUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756026475; c=relaxed/simple;
	bh=Mq+/hYWq0cVG+amD6qkQ0L109sYYur24JCBfR8TL8t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIdrsVzvT+j/EEEakEro/B60LRXpVzmWgsKInh6tZy1HMWFtcnXtXSTFS2VpkVRbzqcKjhe0A/UINqCwi9m4gMO3mFo6eUDUqhw1jT8y71qzQrcFkIY6uGodX7U7H9d01Fmcc4Dbsohdixi07KXsY7hzVjsfhaECedcOFHd2h/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=excello.cz; spf=pass smtp.mailfrom=excello.cz; dkim=pass (2048-bit key) header.d=excello.cz header.i=@excello.cz header.b=UFCMSKIB; arc=none smtp.client-ip=89.187.156.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=excello.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=excello.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=excello.cz header.i=@excello.cz header.b="UFCMSKIB"
Received: (qmail 4987 invoked from network); 24 Aug 2025 11:01:08 +0200
Received: from vm1.excello.cz by vm1.excello.cz
 (VF-Scanner: Clear:RC:0(89.187.156.50):SC:0(-0.410381/5.0):CC:0:;
 processed in 0.5 s); 24 Aug 2025 09:01:08 +0000
X-VF-Scanner-Mail-From: pv@excello.cz
X-VF-Scanner-Rcpt-To: regressions@lists.linux.dev
X-VF-Scanner-ID: 20250824090107.635564.4954.vm1.excello.cz.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=excello.cz; h=
	date:message-id:from:to:subject:reply-to; q=dns/txt; s=default2;
	 t=1756026067; bh=FTo/8VYVYhnYGdhHVBkoNGOEq4VXoYQoUU679M2OnzU=; b=
	UFCMSKIB3ziRjlURnAipSVzV4yy1JEF4MxM6fT5SSSH7S8IfJo/5Xza9JyE6qxAj
	FbaZrIfjwVNHZiyi3pyZdz4erXWnKaLnBYg9a6o45CQW47o/ABehQjHR6PA+GwQX
	ucFGUyBS2Dx4LnZ5evl1Yl5uYKqwk9z7wrYWq1dvSNY0dJlDLWm09aB0BHeJXHf9
	3SO+prI5o/aI3g+sCjrJ1xk9GxxGE5+AgNjTHSLItEMhzkazjtcg8x5uCt0Fwo01
	Alc0P68wLvoMILCJSQkSDQaEWtJMbOyTVdoFeifpmSoZRA4b3r5X2prqcMaDw2Nc
	U1boe9ojq/zWGiul5Y+ppA==
Received: from posta.excello.cz (89.187.156.50)
  by out2.virusfree.cz with ESMTPS (TLSv1.3, TLS_AES_256_GCM_SHA384); 24 Aug 2025 11:01:07 +0200
Received: from arkam (nat-86g.starnet.cz [109.164.54.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by posta.excello.cz (Postfix) with ESMTPSA id 4FA8F9D7482;
	Sun, 24 Aug 2025 11:00:57 +0200 (CEST)
Date: Sun, 24 Aug 2025 11:00:55 +0200
From: Petr =?utf-8?B?VmFuxJtr?= <pv@excello.cz>
To: wangzijie <wangzijie1@honor.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org, viro@zeniv.linux.org.uk,
	adobriyan@gmail.com, rick.p.edgecombe@intel.com, ast@kernel.org,
	k.shutemov@gmail.com, jirislaby@kernel.org,
	linux-fsdevel@vger.kernel.org, polynomial-c@gmx.de,
	gregkh@linuxfoundation.org, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3] proc: fix missing pde_set_flags() for net proc files
Message-ID: <20258249055-aKrUxz36A3Yw6qDd-pv@excello.cz>
References: <20250821105806.1453833-1-wangzijie1@honor.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821105806.1453833-1-wangzijie1@honor.com>

On Thu, Aug 21, 2025 at 06:58:06PM +0800, wangzijie wrote:
> To avoid potential UAF issues during module removal races, we use pde_set_flags()
> to save proc_ops flags in PDE itself before proc_register(), and then use
> pde_has_proc_*() helpers instead of directly dereferencing pde->proc_ops->*.
> 
> However, the pde_set_flags() call was missing when creating net related proc files.
> This omission caused incorrect behavior which FMODE_LSEEK was being cleared
> inappropriately in proc_reg_open() for net proc files. Lars reported it in this link[1].
> 
> Fix this by ensuring pde_set_flags() is called when register proc entry, and add
> NULL check for proc_ops in pde_set_flags().
> 
> [1]: https://lore.kernel.org/all/20250815195616.64497967@chagall.paradoxon.rec/
> 
> Fixes: ff7ec8dc1b64 ("proc: use the same treatment to check proc_lseek as ones for proc_read_iter et.al")
> Cc: stable@vger.kernel.org
> Reported-by: Lars Wendler <polynomial-c@gmx.de>
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Tested-by: Petr Vaněk <pv@excello.cz>

We have noticed lseek issue with /proc/self/net/sockstat file recently
and this patch fixes it for us.

Thanks,
Petr
