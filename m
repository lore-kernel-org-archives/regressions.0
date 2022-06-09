Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBED7A
	for <regressions@lists.linux.dev>; Thu,  9 Jun 2022 17:47:47 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso2051776pjb.0
        for <regressions@lists.linux.dev>; Thu, 09 Jun 2022 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b9oolEZCMKFW54fooG59c84yEUWgHZBbtR7AfCAYdYI=;
        b=X41D9Z1M9z11lUWedCO5eNRFRapXlxPrsuECpK13PvOvf2i1VqGFPiimjY6gh8oGqa
         7HbfsPGMpMPCFR49lDG9d9wCISozqdegH3GP7WkRN5d/3FvL7KAKpGG3rneRsYiCASfU
         ch6bjD6f9Nz1TEmXrL5N8RmhaZc9l6PQZdecdH12/5/rLoM5uGhhW3lbKW/DbeL2nM1g
         pfyhzA+c7lyHLYow3MzkHrR8Z262rXzMRhAuzarc7VQQklAckxSTD+KVDXMjlw9y65jM
         uB/nlOgdxjm86dKvsVqxi//096hBdFfWihztJAZ1SDFmxoQuPe+C7eKaEYHialep6Iko
         lXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9oolEZCMKFW54fooG59c84yEUWgHZBbtR7AfCAYdYI=;
        b=ord0Odu9XM61JLRmLo67i+lvJYZzaX41MhX6EK2cikaEkTKse6pkmAlTW3BgpEE91k
         2vITLxhKZOvvzkvfJbusRYmXfeopIb6+TP9VkGMw3ZfMjhZdeg8wiJLvxHvc68RIJId+
         c1lQVE5ol8Rh7eVStAMYvILpAlxzOTe8pJ54yuZV6havgdACGPr8K1qiixj+GrcE9OD0
         AP1+9YT82j1ERMe0WfLY3o5ixu4Blfwsybaqm54XMZiSI5q1jlhw58N/xzUAkXOHqSYD
         9iNrmrvmE431m1Y4oTe6sPFAkFKG2pmWu+uoT9HGMV3TDvs6E+H/pDQFq2nCTEQlMR5C
         Gi1A==
X-Gm-Message-State: AOAM531Hhq+TLvRPuZ8zRhqUnaDwgED9y12lrsnMlAdvNebplnOnWqGP
	DZsrt40pNtbISV7tGSo+gp2F5TKxFiO/mXQvnOGm7Q==
X-Google-Smtp-Source: ABdhPJxLjqCNbzof1vIJhdH5pog7yCXy+y68VQTqER1z0tqe95qssQwKtKqsASY83T43LyDA+aIwt77I/KrM0pJHgEA=
X-Received: by 2002:a17:90b:4a4e:b0:1e6:6757:d085 with SMTP id
 lb14-20020a17090b4a4e00b001e66757d085mr4470182pjb.207.1654796866625; Thu, 09
 Jun 2022 10:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com> <YqItYKEIvsw4Yzjx@carbon>
In-Reply-To: <YqItYKEIvsw4Yzjx@carbon>
From: Shakeel Butt <shakeelb@google.com>
Date: Thu, 9 Jun 2022 10:47:35 -0700
Message-ID: <CALvZod6ojDd8Bc0VcyFEk-ZrdkFezvQPUvbGg3wyzae+NOp_4A@mail.gmail.com>
Subject: Re: [next] arm64: boot failed - next-20220606
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Raghuram Thammiraju <raghuram.thammiraju@arm.com>, 
	Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>, Vasily Averin <vvs@openvz.org>, 
	Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 9, 2022 at 10:27 AM Roman Gushchin <roman.gushchin@linux.dev> wrote:
>
[...]
> +struct mem_cgroup *mem_cgroup_from_obj(void *p)
> +{
> +       struct folio *folio;
> +
> +       if (mem_cgroup_disabled())
> +               return NULL;
> +
> +       if (unlikely(is_vmalloc_addr(p)))
> +               folio = page_folio(vmalloc_to_page(p));

Do we need to check for NULL from vmalloc_to_page(p)?

> +       else
> +               folio = virt_to_folio(p);
> +
> +       return mem_cgroup_from_obj_folio(folio, p);
> +}
