Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE2E33C4
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 13:54:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 605A567373; Wed, 22 Mar 2023 14:54:06 +0100 (CET)
Date: Wed, 22 Mar 2023 14:54:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Adriaanse <jason_a69@yahoo.co.uk>
Cc: regressions@leemhuis.info, hch@lst.de, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] Bug 217218 - Trying to boot Linux version 6-2.2
 kernel with Marvell SATA controller 88SE9235
Message-ID: <20230322135406.GB16587@lst.de>
References: <a79ea7f5-6a41-a6c9-cfec-ba01aa2a3cfa@leemhuis.info> <71eb8118-035c-8a21-40dc-708b8ad511fc@yahoo.co.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71eb8118-035c-8a21-40dc-708b8ad511fc@yahoo.co.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Mar 22, 2023 at 05:46:09PM +0800, Jason Adriaanse wrote:
> Bonjuerno Christoph,
>
> I am the user who logged the original problem, is there anything I can do 
> to help debug the issue?
>
> I do not mind testing patches or to help in any way I can.

Hi Jason,

I'm a little unresponsive right now as I'm dealing with the fallout
of a strike tomorrow that is disrupting my travel.  So for now,
just a quick idea off my mind:

  1) is CONFIG_GART_IOMMU enabled in your kernel
  2) if so can you disable it and see if that makes the problem go away?
