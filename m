Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAB070
	for <regressions@lists.linux.dev>; Mon, 28 Jun 2021 15:26:31 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 6B49A8047;
	Mon, 28 Jun 2021 15:26:41 +0000 (UTC)
Date: Mon, 28 Jun 2021 18:26:26 +0300
From: Tony Lindgren <tony@atomide.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-omap@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2 3/3] arm: extend pfn_valid to take into accound freed
 memory map alignment
Message-ID: <YNnqIv3PApHFZMgp@atomide.com>
References: <20210519141436.11961-1-rppt@kernel.org>
 <20210519141436.11961-4-rppt@kernel.org>
 <YNmiW6CYzy9lG8ks@atomide.com>
 <YNnLxFM4ZeQ5epX3@linux.ibm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNnLxFM4ZeQ5epX3@linux.ibm.com>

* Mike Rapoport <rppt@linux.ibm.com> [210628 14:07]:
> Can you please send log with 'memblock=debug' added to the command line?

Sure, log now available at:

http://muru.com/beagle-x15.txt

Regards,

Tony
