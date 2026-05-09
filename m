Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219D138AC64;
	Sat,  9 May 2026 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778330848; cv=none; b=NmEXB9m8Banqetx/tbW/0kB3q9A0PL+kLuZ6+y1PnZdVmv7ZV05bWBSaLnO5Dfpznpq1+saIUsXNXj+slNiQ4bUp4PiwVdS9UtD7EE5006B7SQoinw0DJfnThi9X5/nDVhDzXfNKGI+AuMHoZuCTg9l2kIGEXx8OySzh7cTxXxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778330848; c=relaxed/simple;
	bh=tJH39pP2r/C+aDyFKlChMAjTtQ/FE9m1Z87av86WDl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QGCrX85jcPMR96nQaG1okiu30FlIHK2Ma37fgAIt562/MwRCpR/NZyAkLCWbAn5el66AaUvT+g2owb3UlskZYG+gXfF3RJ0lEs1BtjBwSiM+aN1at5XjLjchoFWpqX/x0iudfR/WrjRROO81W4b1idKiIi2J6yahlD/bZi2cXM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThaO49Y0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThaO49Y0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1D4C2BCF4;
	Sat,  9 May 2026 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778330848;
	bh=tJH39pP2r/C+aDyFKlChMAjTtQ/FE9m1Z87av86WDl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ThaO49Y0JzgbdY0bfuZnKprenNm7AV2QSGTUpSsSPlAtuxEZzP4bmrvJkxMDub2VZ
	 5AO6EQRqE/O1UcGQUPxNi9IajwWqPRwckTqsVuqlbb6B+GZY2NISP1SQ4B0IPfBIXb
	 QTfPnmc7nRrk0eUy/UAlp6aqSfvZTKjHCfq56wMeoSYIrRsd0JxmhzIL/x/GeFbz9/
	 UFok+MJBuSqBp6FZLbR4JdQO4Zo3aMvkFt3SHfAFPPrg3TDnE2mxixzuf5CPblgmrc
	 1l4lFR6ghDxqOG047TxSKtefO8KlNHdWHu04jl800dWetrG85UF9cFMRgbcWaDbbYD
	 tvFbQy7k07QrA==
From: Sasha Levin <sashal@kernel.org>
To: stable <stable@vger.kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	regressions@lists.linux.dev,
	Ankit Soni <Ankit.Soni@amd.com>,
	Srikanth Aithal <sraithal@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	1135313@bugs.debian.org,
	Friedemann Stoyan <fstoyan@swapon.de>,
	Salvatore Bonaccorso <carnil@debian.org>
Subject: Re: Please backport 9e249c484128 ("iommu/amd: serialize sequence allocation under concurrent TLB invalidations") to 6.12.y
Date: Sat,  9 May 2026 08:46:51 -0400
Message-ID: <20260509122858.287b6eb9d6ed.re-iommu-amd-serialize-6.12-6.6@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <afpVqZDIRVmdV960@eldamar.lan>
References: <afpVqZDIRVmdV960@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1135313#43 confirmed
> that a backport of 9e249c484128 solved the problem. Now that one does
> not apply cleanly. As an alternative the following two might work, the
> first is a clean cherry-pick, the second on top needed a slight
> adjustment since in 6.12.y f32fe7cb0198 is not present.

Both patches queued for 6.12.y.

I extended the same backport to 6.6.y as well - it carries d2a0cac10597
and the same older atomic64_add_return(1,..) pattern, so it is exposed
to the same race.

--
Sasha
