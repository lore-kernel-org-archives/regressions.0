Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1011FAF
	for <regressions@lists.linux.dev>; Tue, 18 Oct 2022 07:23:47 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id n7so13036691plp.1
        for <regressions@lists.linux.dev>; Tue, 18 Oct 2022 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBwuizpkCKbq1SvzVMTwyeKTeXU4LazpzWWzaVv1xBU=;
        b=aE7vPfO8sNeJjmd/6/cG+NJE5XS1hLqfbe0KMmeekFjfDWtjLVy53z9pfBfXOMzWuh
         eDT/imD4IeynJD2dWFql4p8zJY2WZs8QUXbQxyzFSF6EepBDqR9uuJgyuGUdlaMPPHWL
         RL9JuKT27kiWLLwEpO9Y52KYBELWN+ut62KpOnxhB/gj/M4Wmfivx7tx7vbYAKA4tBQ6
         NmG0/jv0u6rHohU8wJAn0cKYdVfouhHLXaEZqyVYceit5hsj6J/KkfFsMDv77yhtiBZ8
         hcR2raWRMmz2UjDXo3TOefvDKI9qGwT78EKy/cXIv3fLJf3TfoYH70G2C8TeGoD+4lIA
         utpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBwuizpkCKbq1SvzVMTwyeKTeXU4LazpzWWzaVv1xBU=;
        b=CyfCY7NcjIHPgQzMCL4eTjBPbWTcWEfcd3KQoueP7iMC5V7Z2qOR48AT5FtKeeB3rT
         +JsIbtLBtd0L/cwHyC4AbJUoe4tZAoX7rmOZxHsLNiRwB4C6Gv08HqwyOiqeoCBJUYU6
         mqL1ERxVj+MPE3/52JazgMCtq36MIgQjpdjvpmZXKXgmSokAoCkofm7YFSjk8RJqjcNe
         cCqiben/Fp9mKXbavS9ArdLlS+bHTVzYKrVDAycHtIFi4GQy4eWM2JUNJphwvaocC4ht
         wL1pxCDEyY5H3WAGkQlzRHJ1l5rHHGkOyY3sx0Y0mSwgCPKC4+ANql3iShRaBQ4wymtQ
         Z2Ig==
X-Gm-Message-State: ACrzQf1yRy34TvFbkMILObfLr6hKlf8nV7Q0/cf/iuSQzKaO2mpOuk+y
	yy2IH2v+n0bEBoTPf2T5kMw=
X-Google-Smtp-Source: AMsMyM5rNrKDU+uoU480m4jpkMFZ7GXOSt2UncqLsHnNn74mJccwffNoJpUYBZUR6Tk0KShwwcpK1g==
X-Received: by 2002:a17:90a:2849:b0:20a:f3ff:c983 with SMTP id p9-20020a17090a284900b0020af3ffc983mr2106136pjf.198.1666077826587;
        Tue, 18 Oct 2022 00:23:46 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-93.three.co.id. [180.214.233.93])
        by smtp.gmail.com with ESMTPSA id y126-20020a623284000000b00560cdb3784bsm8353589pfy.60.2022.10.18.00.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 00:23:46 -0700 (PDT)
Message-ID: <2522e5d5-5f8a-c5e9-4864-a82f0e6d2512@gmail.com>
Date: Tue, 18 Oct 2022 14:23:42 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
Content-Language: en-US
To: Jintao Yin <nicememory@gmail.com>, phillip@squashfs.org.uk
Cc: linux-kernel@vger.kernel.org, marcmiltenberger@gmail.com,
 mirsad.todorovac@alu.unizg.hr, regressions@leemhuis.info,
 regressions@lists.linux.dev, srw@sladewatkins.net
References: <20221015205936.5735-1-phillip@squashfs.org.uk>
 <20221018021507.612-1-nicememory@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221018021507.612-1-nicememory@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/22 09:15, Jintao Yin wrote:
> Hi Phillip,
>   There is a logical bug in commit 8fc78b6fe24c36b151ac98d7546591ed92083d4f
>   which is parent commit of commit b09a7a036d2035b14636cd4c4c69518d73770f65.
>   
>   In function squashfs_readahead(...),
>   file_end is initialized with i_size_read(inode) >> msblk->block_log,
>   which means the last block index of the file.
>   But later in the logic to check if the page is last one or not the
>   code is 
>     if (pages[nr_pages - 1]->index == file_end && bytes) {
>       ...
>     }
>   , use file_end as the last page index of file but actually is the last
>   block index, so for the common setup of page and block size, the first 
>   comparison is true only when pages[nr_pages - 1]->index is 0.
>   Otherwise, the trailing bytes of last page won't be zeroed.
> 
>   Maybe it's the real cause of the snap bug in some way.
> 

Hi Jintao, thanks for explaining the real culprit. However, I'd like to
see the fixup patch from you so that we can test.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

