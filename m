Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se [213.80.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4B66AAD
	for <regressions@lists.linux.dev>; Sun, 25 Jun 2023 15:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id B6AE83F51A;
	Sun, 25 Jun 2023 17:40:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.91
X-Spam-Level:
X-Spam-Status: No, score=-1.91 tagged_above=-999 required=6.31
	tests=[BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
	by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lG22FXXqcO0I; Sun, 25 Jun 2023 17:40:25 +0200 (CEST)
Received: 
	by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 33FEA3F3FA;
	Sun, 25 Jun 2023 17:40:21 +0200 (CEST)
Received: from [2a00:801:798:c6f9::21a0:d26f] (port=45518 helo=[10.218.58.85])
	by tnonline.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <forza@tnonline.net>)
	id 1qDRqd-0007SE-Iv; Sun, 25 Jun 2023 17:40:20 +0200
Date: Sun, 25 Jun 2023 17:40:17 +0200 (GMT+02:00)
From: Forza <forza@tnonline.net>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, a1bert@atlas.cz,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Song Liu <song@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Message-ID: <11b893e.86425ef4.188f33688b8@tnonline.net>
In-Reply-To: <20230607093316.cdf60df195915fa9d38067ea@linux-foundation.org>
References: <20230605201107.83298-1-lstoakes@gmail.com> <cd47d6ac-69ce-0315-dd45-2cb9dce57f36@suse.cz> <f6b42d95-09f1-48d6-8274-e6145febb31d@lucifer.local> <2a6fa9d6-53b8-93cd-16c8-309ce2b8e3ac@suse.cz> <20230607093316.cdf60df195915fa9d38067ea@linux-foundation.org>
Subject: Re: [PATCH] mm/vmalloc: do not output a spurious warning when huge
 vmalloc() fails
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Mailer: R2Mail2



---- From: Andrew Morton <akpm@linux-foundation.org> -- Sent: 2023-06-07 - =
18:33 ----

> On Wed, 7 Jun 2023 10:58:40 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
>=20
>> I would really suggest moving the fix to
>> mm-hotfixes instead of mm-unstable, and
>>=20
>> Fixes: 80b1d8fdfad1 ("mm: vmalloc: correct use of __GFP_NOWARN mask in _=
_vmalloc_area_node()")
>> Cc: <stable@vger.kernel.org>
>=20
> I've made those changes.

Did the chabge go into 6.3 stable? I saw these issues with kernels 6.3.0-6 =
3.7. I now updated to 6.3.9 and have had no more warnings since.=20

