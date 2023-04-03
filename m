Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD8A935;
	Mon,  3 Apr 2023 21:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D179C433D2;
	Mon,  3 Apr 2023 21:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680558469;
	bh=8KWLJjSZIZj1GfIA0VE1J8hGTHhJxpfeC8mL2Td2i4Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=P2KWn31KxBb4Gb6IsVqg0SCxuS6b2Gpl39PPYCssv4PpOVUEwBMGQ2DhvRwy3Omz9
	 BVtQgz0nxtOAfXooZbSTA0MyQE1K0oLZCtZECRwMZAqJMiwLNlHraJaalfiTN5AORY
	 MwQyusyJTWnjwf3lZQZKAgciIHEyxqS9XmsXbKxlbZZCTeeA18C+iZkiPe/iVDplTp
	 x0arjpGBG6hcuUwg7/r+UTGjsUmnCEjH7jN3nQ625K7fyipRvizpEaUrbbQWFxYueD
	 o9bi50SflnPXOT8i53k9JgV3TkATX4j1/SxJLJXxN+It18BOMzSE10FrlOBQ2UDnvS
	 NbHEXZvZBzwLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4A9A4E5EA86;
	Mon,  3 Apr 2023 21:47:49 +0000 (UTC)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: aros@gmx.com, regressions@lists.linux.dev, 
 konstantin@linuxfoundation.org, bugs@lists.linux.dev, 
 workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@leemhuis.info, tools@linux.kernel.org
Message-ID: <20230403-b217297-6bf5914fb55d@bugzilla.kernel.org>
In-Reply-To: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
Subject: Re: Introducing bugbot
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1
Date: Mon,  3 Apr 2023 21:47:49 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=217297

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

