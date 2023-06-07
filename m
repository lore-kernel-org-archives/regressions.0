Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E43922D
	for <regressions@lists.linux.dev>; Wed,  7 Jun 2023 16:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A08C433EF;
	Wed,  7 Jun 2023 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1686155597;
	bh=a4k7fLJjOiIms++hQYdyBnf+j4UhqPEACo0OX7DfeOA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NmIPu18W+pJkM0lO/DC7pbDB5o3AvJWWhn2+GGnOFS93zJ18c3XkB9q0La/OU1HHU
	 64ZPOaY4cKqjNkaqbl2xWud2dTMKVfc6XbJI4fQcNEcBD67RAqL2XV2Nool75/lPVn
	 3D1NKKozdOdTi2so72/F347ROSGc+aYNS5kWPcd0=
Date: Wed, 7 Jun 2023 09:33:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>, Uladzislau Rezki
 <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Linux btrfs <linux-btrfs@vger.kernel.org>, Linux
 Regressions <regressions@lists.linux.dev>, Chris Mason <clm@fb.com>, Josef
 Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 a1bert@atlas.cz, Forza <forza@tnonline.net>, Linus Torvalds
 <torvalds@linux-foundation.org>, Song Liu <song@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm/vmalloc: do not output a spurious warning when huge
 vmalloc() fails
Message-Id: <20230607093316.cdf60df195915fa9d38067ea@linux-foundation.org>
In-Reply-To: <2a6fa9d6-53b8-93cd-16c8-309ce2b8e3ac@suse.cz>
References: <20230605201107.83298-1-lstoakes@gmail.com>
	<cd47d6ac-69ce-0315-dd45-2cb9dce57f36@suse.cz>
	<f6b42d95-09f1-48d6-8274-e6145febb31d@lucifer.local>
	<2a6fa9d6-53b8-93cd-16c8-309ce2b8e3ac@suse.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 Jun 2023 10:58:40 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:

> I would really suggest moving the fix to
> mm-hotfixes instead of mm-unstable, and
> 
> Fixes: 80b1d8fdfad1 ("mm: vmalloc: correct use of __GFP_NOWARN mask in __vmalloc_area_node()")
> Cc: <stable@vger.kernel.org>

I've made those changes.
