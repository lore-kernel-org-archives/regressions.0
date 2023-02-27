Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A662113
	for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 11:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A134C433D2;
	Mon, 27 Feb 2023 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677496595;
	bh=OCnuVHfTM8bsKp1pJnUUE+YpXalPHtoR3rXmWbJ+iYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T0B4yn2G2QFH/NCse4bwiWVX2K3xAvwpAt2ZTrHnx+4WsYQclg+vggXEMzMkkl+oF
	 95LFcSMIWdDuEkIQrIUbQlNmt2IdFHI7asntUyYIYhCelPgLd3dlOjfXjPI/1kuosZ
	 fyVtG8vjUM7DGoRC4hIslRDBmoWhICBr/1pt/fHIGMZ9/rIa0Tk8mmwZm0GTyBVCdw
	 WohVgXiyEgkIRRKgefcU7muwel9KyipsVknnfX2ZrWwbT+NTmc2YDS48RdphEwRdwA
	 6th3XfX7k7GEEFV4KowogX2EVfo2gME0gkHgYaIxnLibqTDeQuGINhAYtuMR8nEXju
	 ymdc3fYEpOPdg==
Date: Mon, 27 Feb 2023 13:16:33 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	"Jason@zx2c4.com" <Jason@zx2c4.com>,
	"linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: [PATCH 1/1] tpm: disable hwrng for fTPM on some AMD designs
Message-ID: <Y/yREQ55cvAcC8KF@kernel.org>
References: <20230214201955.7461-1-mario.limonciello@amd.com>
 <20230214201955.7461-2-mario.limonciello@amd.com>
 <50b5498c-38fb-e2e8-63f0-3d5bbc047737@leemhuis.info>
 <Y/ABPhpMQrQgQ72l@kernel.org>
 <03c045b5-73f8-0522-9966-472404068949@amd.com>
 <Y/VLYxAqmlF8nbw3@kernel.org>
 <MN0PR12MB610146866686D09CBFEC7AA2E2A59@MN0PR12MB6101.namprd12.prod.outlook.com>
 <2a381d6c-25d9-0027-4951-c0012d09b498@leemhuis.info>
 <Y/yQoseTuwRcjV+v@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/yQoseTuwRcjV+v@kernel.org>

On Mon, Feb 27, 2023 at 01:14:46PM +0200, Jarkko Sakkinen wrote:
> On Mon, Feb 27, 2023 at 11:57:15AM +0100, Thorsten Leemhuis wrote:
> > Hi, this is your Linux kernel regression tracker. Top-posting for once,
> > to make this easily accessible to everyone.
> > 
> > Jarkko (or James), what is needed to get this regression resolved? More
> > people showed up that are apparently affected by this. Sure, 6.2 is out,
> > but it's a regression in 6.1 it thus would be good to fix rather sooner
> > than later. Ideally this week, if you ask me.
> 
> I do not see any tested-by's responded to v2 patch. I.e. we have
> an unverified solution, which cannot be applied.

v2 is good enough as far as I'm concerned as long as we know it is
good to go. Please do not respond tested-by to his thread. Test it
and respond to the corresponding thread so that all tags can be
picked by b4.

BR, Jarkko
