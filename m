Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA726215065
	for <regressions@lists.linux.dev>; Mon,  9 Dec 2024 08:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731447; cv=none; b=E8ee2TcgCsri7N2oeJJmOizz5VHVCpzAlPkL8HiEJwqvnQ61RqID3g+lF8uqfs66ZxUTc5P6958EUWbf2Bh5tc7js59HzObRTKpBQYjw/P/6k1cdVE24At/HMoIrLtauFOlYsT/9v71RcuUplz96J6mugmQYZ4SjSUdk+Yfcljo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731447; c=relaxed/simple;
	bh=5t3WINfmpl6qeP57QN3uRj4igdODIRNBNLbjh+/Wgnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGZWmQJfF2nhCh7nF6Ac3W3b9V8JPldwGslLcMQ1pM8kxlVHwFC/rvbhL4G5pTcgFP7+4jzVERwSkc1q6P/ba6lXUQ9d/2DAiWvSCbZsmJrdfcVWctij6rWq+59T0BszNRWOOcieiVhrWWoERqkI1KYoCxb74tmMXo8NiEJ0S0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E98C668D0A; Mon,  9 Dec 2024 09:04:02 +0100 (CET)
Date: Mon, 9 Dec 2024 09:04:02 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Hildenbrand <david@redhat.com>
Cc: Simon Polack <spolack@mailbox.org>, kbusch@kernel.org, hch@lst.de,
	linux-mm@kvack.org, regressions@lists.linux.dev,
	linux-nvme@lists.infradead.org, 'linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] 6.13-rc1: Loading nvme module leads to
 mm/page_alloc.c:4727 __alloc_pages_noprof+0x321/0x330
Message-ID: <20241209080402.GA24898@lst.de>
References: <5fcdfd16-d598-4a86-962e-9d22b0524b12@mailbox.org> <81b0b8bf-632f-4f71-8357-41ebf7421919@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81b0b8bf-632f-4f71-8357-41ebf7421919@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

This should be fixed in -rc2.

