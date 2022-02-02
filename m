Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F432F23
	for <regressions@lists.linux.dev>; Wed,  2 Feb 2022 19:31:59 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 41B0128004EAD;
	Wed,  2 Feb 2022 20:22:18 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3444B69C25; Wed,  2 Feb 2022 20:22:18 +0100 (CET)
Date: Wed, 2 Feb 2022 20:22:18 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev
Subject: Re: [Bug 215525] New: HotPlug does not work on upstream kernel
 5.17.0-rc1
Message-ID: <20220202192218.GA18800@wunner.de>
References: <20220124214635.GA1553164@bhelgaas>
 <f6220c47-0593-abc8-6faa-28e8b719fa77@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6220c47-0593-abc8-6faa-28e8b719fa77@leemhuis.info>
User-Agent: Mutt/1.10.1 (2018-07-13)

#regzbot introduced: 04b12ef163d1
#regzbot invalid: according to Bjorn, "it was arguably a bug that it *did* work before", see https://lore.kernel.org/linux-pci/20220202164308.GA17822@bhelgaas/
