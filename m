Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D59E1428A
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 14:48:49 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qJEf2-0003Uo-GS; Tue, 11 Jul 2023 16:48:16 +0200
Message-ID: <2c3ab284-fd11-d6c5-c03c-60d54ad227b5@leemhuis.info>
Date: Tue, 11 Jul 2023 16:48:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 12/32] mm/vmalloc: vmalloc_to_page() use
 pte_offset_kernel()
Content-Language: en-US, de-DE
To: Mark Brown <broonie@kernel.org>, Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Yang Shi <shy828301@gmail.com>,
 Mel Gorman <mgorman@techsingularity.net>, Peter Xu <peterx@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Ira Weiny <ira.weiny@intel.com>,
 Steven Price <steven.price@arm.com>, SeongJae Park <sj@kernel.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>, Huang Ying <ying.huang@intel.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Zack Rusin
 <zackr@vmware.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Miaohe Lin
 <linmiaohe@huawei.com>, Minchan Kim <minchan@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Song Liu <song@kernel.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <c1c9a74a-bc5b-15ea-e5d2-8ec34bc921d@google.com>
 <696386a-84f8-b33c-82e5-f865ed6eb39@google.com>
 <42279f1f-7b82-40dc-8546-86171018729c@sirena.org.uk>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <42279f1f-7b82-40dc-8546-86171018729c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689086929;620ad894;
X-HE-SMSGID: 1qJEf2-0003Uo-GS

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 10.07.23 16:42, Mark Brown wrote:
> On Thu, Jun 08, 2023 at 06:21:41PM -0700, Hugh Dickins wrote:
>> vmalloc_to_page() was using pte_offset_map() (followed by pte_unmap()),
>> but it's intended for userspace page tables: prefer pte_offset_kernel().
>>
>> Signed-off-by: Hugh Dickins <hughd@google.com>
>> Reviewed-by: Lorenzo Stoakes <lstoakes@gmail.com>
> 
> Currently Linus' tree is reliably failing to boot on pine64plus, an
> arm64 SBC.  Most other boards seem fine, though I am seeing some
> additional instability on Tritium which is another Allwinner platform,
> I've not dug into that yet and Tritium is generally less stable.
> 
> We end up seeing NULL or otherwise bad pointer dereferences, the
> [...]
> # first bad commit: [0d1c81edc61e553ed7a5db18fb8074c8b78e1538] mm/vmalloc: vmalloc_to_page() use pte_offset_kernel()

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 0d1c81edc61e553ed7a5db18fb8074c8
#regzbot title mm/vmalloc: NULL or otherwise bad pointer dereferences on
ARM64
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
