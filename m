Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F3639
	for <regressions@lists.linux.dev>; Tue,  8 Aug 2023 05:53:43 +0000 (UTC)
Received: from [185.238.219.21] (helo=[192.168.44.45]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qTFeQ-0003sC-03; Tue, 08 Aug 2023 07:53:02 +0200
Message-ID: <88bb7f30-cbfe-feb4-1101-b7c98843652d@leemhuis.info>
Date: Tue, 8 Aug 2023 07:52:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH v2 12/32] mm/vmalloc: vmalloc_to_page() use
 pte_offset_kernel()
Content-Language: en-US, de-DE
To: Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Yang Shi <shy828301@gmail.com>,
 Mel Gorman <mgorman@techsingularity.net>, Peter Xu <peterx@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Yu Zhao <yuzhao@google.com>,
 Alistair Popple <apopple@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Ira Weiny <ira.weiny@intel.com>, Steven Price <steven.price@arm.com>,
 SeongJae Park <sj@kernel.org>, Huang Ying <ying.huang@intel.com>,
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
 <901ae88d-ad0c-4e9d-b199-f1566cc62a00@lucifer.local>
 <c2358f37-ebaa-44d1-b443-ff91bdedc00b@sirena.org.uk>
 <977ddee4-35f0-fcd1-2fd-1c3057e7ea2a@google.com>
 <fbb2b76c-bc5c-4d75-b8cd-37479de688d4@sirena.org.uk>
 <b479b946-f052-eb75-295d-6fa7c2d8ce8e@google.com>
 <591b5253-47f0-440c-84b6-7786ff59667d@sirena.org.uk>
 <20230720103227.GB11034@willie-the-truck>
 <df264993-107c-44a1-a8ff-245bce044206@sirena.org.uk>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <df264993-107c-44a1-a8ff-245bce044206@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691474024;bacff829;
X-HE-SMSGID: 1qTFeQ-0003sC-03

On 20.07.23 14:06, Mark Brown wrote:
> On Thu, Jul 20, 2023 at 11:32:28AM +0100, Will Deacon wrote:
>> On Tue, Jul 11, 2023 at 06:57:33PM +0100, Mark Brown wrote:
> 
>>> Still investigating but I'm pretty convinced this is nothing to do with
>>> your commit/series and is just common or garden memory corruption that
>>> just happens to get tickled by your changes.  Sorry for the noise.
> 
>> Did you get to the bottom of this? If not, do you have a reliable way to
>> reproduce the problem? I don't like the sound of memory corruption :(
> 
> Not to the bottom of it, but getting there - I isolated the issue to
> something in the unregistration path for thermal zones but didn't manage
> to figure out exactly what.

Hi Mark, just wondering did anything come out of this and is this still
happening? I'm just wondering, as I still have this on my list of
tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
>  There was some indication it might be a use
> after free but I'm not convinced.
> 
> I have a reliable way to reproduce this if you have a pine64plus, it
> also shows up a lot on the Libretech Tritium but not quite so reliably
> as pine64plus since Hugh's changes.  Equally pine64plus was rock solid
> until those so there's some timing/environment thing going on which
> makes the issue manifest obviously, I expect you should be able to
> trigger the issue by unregistering a thermal driver but the effects
> might not be visible.
> 
> There is a change on the list to make the Allwinner SoCs not trigger the
> issue during boot (their thermal driver refuses to register if any one
> zone fails but most of their SoCs have multiple thermal zones with only
> one fully described) but it needs fixing either way.
