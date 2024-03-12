Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF5179DD4
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710273778; cv=none; b=aE9Wwixk+GeIjSNgVrwoMAEbrR4FZoQi2EZwt8mznqGZREcyleuiVfm7vTmIaj+AU6Fmr0NMp+m+ger5mt+fyxtj5xEls5+UrF0OBFqcSsn39qAV2eDcnRMSJKYxd67lQK79RRsmN8uC4XPcIwDjmM1yiaJnU6/RQyBZQvuQOnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710273778; c=relaxed/simple;
	bh=w0F3Vljj+1CRShV+pztrhZYCiYIXdrXhUnzsRvjb3UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUo80IBA+/AamoD1CCWvRq5b9ZA8QqFuBMKvyq/5bNwhNueNWTeyN8Lj5U5/qhCecMgdCdMwRj8QVjFU6eRVGE4ac/4cklmJL9VrOGRvWx0uCSnAp/GAkQqZv5Rm8gnAc9AYlU2CVkJ1KFfMpTuSET8SO07KxN+oKgI+wSFFh1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KHI7rGow; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KHI7rGow"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8FC3B40E0174;
	Tue, 12 Mar 2024 20:02:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SNUhqhzl345T; Tue, 12 Mar 2024 20:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1710273770; bh=G9j3WgM8NkLL61DmuzulPlr5Z8U/krXvHKPrr0OyKRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHI7rGownI4H2gKn+RqK4CbbT4I8e4wAXrnt41AuUUrvzjznqVVeRs337Mdj3Dwk2
	 5W/T3NWNat0g9GqZHp5qtt6HQH6SVfqzkbpIxsOn4AvZfzFi1apXu7z6u6DkNbb9jJ
	 bns7EFfHQ5BlcSX7Khna4glJThk/pGkJulJQ+jotzJ3NA22JWP6n81RlKVBhpGxcna
	 3cmvEUaZmooaMnzZjJ2yA8hj+CO9DufQCKprem8TWOZutIhCH2itfEy/ZYUB8OdX7z
	 ORumPpkkuF3ZEUrA52Cyf4CVMzvQtzAjDsvspgbPS/VwKys/BMgotY9+sod9fRNbJW
	 MrGNjoHRowPIVusuJfFAF9LPZ4NJJnoudL9T+9Mm5XElwsP/i9KQh/67NoG1MJFR9K
	 LpFu4po6VMbms3Knyyd48Rj25psdILdEuaxdWvkMB7F5EWl1+zrdTmkUixqxo98JEE
	 n9ESXDZ4ijYuJQxtGgAOXBkvSe3aOMNNxzsXPMR44pJWGn8Vdj8I8GHJqUn0ISO10a
	 1UMqRM2LcBFIw/cZ3hE+NY4TM2YsIf1oCki2GazxvgoR93Og3kQWvz+G+0NyFwy92L
	 nJu7DRu18b2ic2UGfz8Y3pmDvpU7cpBHVRE4Br16EjFZw2l4gQVxoOBgy7fWL8tYh0
	 USCD/oXDnjG0Ot0iSG+uG5VE=
Received: from zn.tnic (pd953021b.dip0.t-ipconnect.de [217.83.2.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 36DC440E0028;
	Tue, 12 Mar 2024 20:02:45 +0000 (UTC)
Date: Tue, 12 Mar 2024 21:02:39 +0100
From: Borislav Petkov <bp@alien8.de>
To: Mahmoud Adam <mngyadam@amazon.com>
Cc: peterz@infradead.org, tglx@linutronix.de, gregkh@linuxfoundation.org,
	regressions@lists.linux.dev
Subject: Re: Regression caused by 'x86/returnthunk: Allow different return
 thunks'
Message-ID: <20240312200239.GIZfC033qDtEUZmwgV@fat_crate.local>
References: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>

On Tue, Mar 12, 2024 at 08:58:39PM +0100, Mahmoud Adam wrote:
> note: the regression is seen even with retbleed=off and also with spectre_v2=off

Try with spec_rstack_overflow=off or mitigations=off.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
