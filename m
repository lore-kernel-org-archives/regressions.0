Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EF57C
	for <regressions@lists.linux.dev>; Fri,  1 Apr 2022 11:34:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A682E67373; Fri,  1 Apr 2022 13:26:49 +0200 (CEST)
Date: Fri, 1 Apr 2022 13:26:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Jian-Hong Pan <jhp@endlessos.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Subject: Re: Bug 215742 - The NVME storage quirked as SIMPLE SUSPEND makes
 system resume failed after suspend (Regression)
Message-ID: <20220401112649.GA14810@lst.de>
References: <edba451c-1798-c60e-5d84-0a9f6a5d134d@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edba451c-1798-c60e-5d84-0a9f6a5d134d@leemhuis.info>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Apr 01, 2022 at 09:55:14AM +0200, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org that afaics nobody
> acted upon since it was reported about a week ago, that's why I decided
> to forward it to the lists and all people that seemed to be relevant
> here. Mario, could you maybe take a look at this? Or is that something
> for the NVM or ACPI people? Or was this discussed somewhere else
> already? Or even fixed?

I've not seenthe report.  Looks like the BIOS sets the StorageD3 flag
in the ACPI tables in this system but doesn't actually want it,
which is really strange.  We could add some kind of quirk based on
DMI matching, but this all seems weird.
