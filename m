Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028E7272E48
	for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434457; cv=none; b=tSTUJdWOezWBEAU2K0DDEYY1fetS1rW2vhFoYFAvJTAQl4m+MYQwn/fy1nmIONDV6tDLWWf44gIG//zR4dPn+gcrs8BgupPNfXeLnwH5nm5yBuoyScVnwC1M2lVCrU9mkoEqBaSewUhD06AZJn7w2jVf9fp4hkNOdD4N2Sgqcz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434457; c=relaxed/simple;
	bh=CHLH3AiFiQHhmy2doh6A67quhE347Z+Zppa97UuIeG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIz3TgP+g7IHRr007LH4fzSXEAjTzjp653na9tmkelOFml8IKoRS3ng6WPPmmMDnw3KZogH8YF4N9ZNhkoA7xGFWy/DUXanmeqxHak/+dRqsJWDQ1r2KAF7UqMQV03jcjMJWhnc6Lg2pICHYJHc0+UdJdfKGzb3yZedLgvxrefI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=U7Ux1+UT; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="U7Ux1+UT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Lp5Z9iTH+ugecgyteyY+wMw9FDVhLK20NW464bjciOY=; b=U7Ux1+UTOOBLVFWeNvZ1LYBq4G
	sS9UgAN7zUZWKWn4drP3pitmFQmIx9UmmoQDDvzbvEoUr731eiz7C+b8wIZItA/QEA9jnJtMpZa3z
	9lNW4USW6c89aICyrodbuMP7SYh0Z5oPwJBgzupGZ9aMq35XWQNfHt4nyOZm5ZRUb98i2VnzqS1cM
	dWRyfEwMSbDueGtu9E2uzKzhehLhAvUID33OLyv82Ew5iWrAbzLeUWBQevSkSHvvPhxqDEgz6TBtO
	tArbcH2RsZEQME6uOr1J6iTTa2wKU6x1XLmGNBYzJDa6Qe8aJbWhaVjntrCQwLbXkBr+CqZIBbX2y
	NnLvR+0g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56256)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ufEOl-0004Zz-27;
	Fri, 25 Jul 2025 10:07:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ufEOi-0001di-3A;
	Fri, 25 Jul 2025 10:07:25 +0100
Date: Fri, 25 Jul 2025 10:07:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, kees@kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250723 arm atags_to_fdt.c undefined reference to
 `__sanitizer_cov_stack_depth'
Message-ID: <aINJTDD3je4XJ6VO@shell.armlinux.org.uk>
References: <CA+G9fYtBk8qnpWvoaFwymCx5s5i-5KXtPGpmf=_+UKJddCOnLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtBk8qnpWvoaFwymCx5s5i-5KXtPGpmf=_+UKJddCOnLA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Jul 25, 2025 at 01:59:02PM +0530, Naresh Kamboju wrote:
> Regressions noticed while building arm builds with gcc-13 and gcc-8
> toolchains on the Linux next-20250723 to next-20250725 tags.
> 
> First seen on the Linux next-20250723
> Good: next-20250722
> Bad:  next-20250723 and next-20250725
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
> 
> ## Build regressions
> * arm, build
>   - gcc-13-lkftconfig-hardening
>   - gcc-8-lkftconfig-hardening
> 
> Build regression: next-20250723 arm atags_to_fdt.c undefined reference
> to `__sanitizer_cov_stack_depth'

"cov" suggests "coverty", and that the symbol is not available in the
kernel suggests that coverty isn't supported.

Maybe some kind of new support has been added, but no one has told the
arm developers, and thus bits needed for it aren't present.

Honestly, I'm not going to worry about it. If someone wishes to
contribute 32-bit arm support, then fine, otherwise I'll just ignore
this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
