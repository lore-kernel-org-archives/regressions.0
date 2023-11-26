Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA05FD26E
	for <regressions@lists.linux.dev>; Sun, 26 Nov 2023 13:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lw5y9c1r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9VJ0rA3r7NTPoB0XFwR/Lf+pF2vP6kSME4kg3g2wpTc=; b=lw5y9c1ry4n30Bn0J1WuMtPLdN
	11Ow8mx7FVsIXslY6+Nje0sBgLNOFldGpOB6Z9G5TRknB/CtaLXS1LU1r7manFVX+4vCPi8NNhSaX
	JDWN8mtj+9HUMAlxf26MaBxJdfEVQKSjF4D8qiVXs8Z8QyDXLl4zPxqJ/26h9+I0UCGS7pz45jWqZ
	Kh7ZjCJL1o9lv7J3cUd59b+AXTSjccl/RnpdTcdLcTm325dohDfiXQk/xOiEIKi2PsgQoTkxXK4+W
	4d//hEHj7WkAGJp4LsWkaw/2P+tJjyMhUFZtdd26GBeivCCd7d6vDpGoQAogwLAHhs/KdAiwApk3M
	iUj1iTYw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r7FTi-00AYix-IB; Sun, 26 Nov 2023 13:47:18 +0000
Date: Sun, 26 Nov 2023 13:47:18 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Wang <00107082@163.com>
Cc: liam.howlett@oracle.com, akpm@linux-foundation.org, ankitag@nvidia.com,
	bagasdotme@gmail.com, chunn@nvidia.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	regressions@lists.linux.dev, surenb@google.com
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Message-ID: <ZWNMZr9QMSBDc0gd@casper.infradead.org>
References: <20231123143452.erzar3sqhg37hjxz@revolver>
 <20231126071854.19490-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126071854.19490-1-00107082@163.com>

On Sun, Nov 26, 2023 at 03:18:54PM +0800, David Wang wrote:
> I add memory access between mmap and munmap to the simple stress, and timeit.

It's still not a very good benchmark ...

> My test code now is:
> 
> 	#define MAXN 1024
> 	struct { void* addr; size_t n; } maps[MAXN];
> 	void accessit(char *addr, size_t n) {
> 		for (int i=0; i<n; i+=128) addr[i]=i;
> 	}
> 	int main() {
> 		int i, n, k, r;
> 		void *p;
> 		for (i=0; i<MAXN; i++) {
> 			n = 1024*((rand()%32)+1);
> 			p = mmap(NULL, n, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);

So 'n' is now a number between 1kB and 32kB.  That's not terribly
realistic; I'd say you want to be more like

			n = 4096 * ((rand() % 512) + 1));

> 		for (i=0; i<10000000; i++) {
> 			k = rand()%MAXN;
> 	#ifdef PAGE_FAULT
> 			accessit((char*)maps[k].addr, maps[k].n);
> 	#endif
> 			r = munmap(maps[k].addr, maps[k].n);
> 			if (r) {
> 				perror("fail to munmap");
> 				return -1;
> 			}
> 			n = 1024*((rand()%32)+1);
> 			p = mmap(NULL, n, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);

Are you simulating something a real application actually does?
Because this all seems very weird and micro-benchmark to me.  The real
applications we've benchmarked see a speedup so I'm not thrilled about
chasing down something that no real application does.

In terms of what's going on in the kernel, for each loop, you're calling
munmap(), taking between 1 and 8 page faults, then calling mmap().
That may just be too few page faults to see the benefit of the maple tree.

